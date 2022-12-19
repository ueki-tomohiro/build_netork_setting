import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:mock_setting/annotation.dart';
import 'package:source_gen/source_gen.dart' show GeneratorForAnnotation;
import 'package:source_gen/src/constants/reader.dart';

class MockSettingGenerator extends GeneratorForAnnotation<GenerateIpSetting> {
  static const _replaceIp = '__ip_addr__';

  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    final setting = <String, String>{};
    for (final annotation in element.metadata) {
      if (annotation.element is! ConstructorElement) continue;
      if (annotation.element?.enclosingElement?.name == 'GenerateIpSetting') {
        final entry = _entryFromGenerateIpSetting(annotation);
        setting[entry.key] = entry.value;
      }
    }

    String host = '';
    if (Platform.isMacOS) {
      final ifconfig = await Process.start('ifconfig', ['-l']);
      final xargs =
          await Process.start('xargs', ['-n1', 'ipconfig', 'getifaddr']);
      await ifconfig.stdout.pipe(xargs.stdin);
      final sed = await Process.start('sed', ['-n', '-e', '1p']);
      await xargs.stdout.pipe(sed.stdin);

      await sed.stdout.transform(utf8.decoder).forEach((element) {
        host = element.trimRight();
      });
    } else {
      host = 'localhost';
    }

    final settingCodes = <Code>[];
    settingCodes.addAll(_createCode(host, setting));

    final settingsLibrary = Library(
      (b) => b
        ..body.addAll([
          ...settingCodes,
        ]),
    );
    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );

    final content = DartFormatter().format(
      '''
${settingsLibrary.accept(emitter)}
''',
    );
    return content;
  }

  List<Code> _createCode(String host, Map<String, String> settings) {
    final List<Code> codes = [Code('final setting = <String, String>{')];
    settings.forEach((key, value) {
      final ip = value.replaceAll(_replaceIp, host);
      codes.add(Code('\'$key\': \'$ip\','));
    });
    codes.add(Code('};'));

    return codes;
  }

  MapEntry<String, String> _entryFromGenerateIpSetting(
      ElementAnnotation annotation) {
    final settingValue = annotation.computeConstantValue()!;
    final nameField = settingValue.getField('name')!;
    final valueField = settingValue.getField('value')!;

    if (nameField.isNull) {
      throw ArgumentError('The GenerateIpSetting "name" argument is missing ');
    }

    if (valueField.isNull) {
      throw ArgumentError('The GenerateIpSetting "value" argument is missing ');
    }

    return MapEntry(nameField.toStringValue()!, valueField.toStringValue()!);
  }
}
