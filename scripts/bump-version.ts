import { select } from "@inquirer/prompts";
import semver from "semver";
import { execSync } from "child_process";

const logType = [
  "added",
  "changed",
  "deprecated",
  "removed",
  "fixed",
  "security",
] as const;

function getLogType(title: string): (typeof logType)[number] {
  const lowTitle = title.toLowerCase();

  if (
    lowTitle.startsWith("chore") ||
    lowTitle.startsWith("feat") ||
    lowTitle.startsWith("docs")
  ) {
    return "added";
  }

  if (
    lowTitle.startsWith("change") ||
    lowTitle.startsWith("update") ||
    lowTitle.startsWith("revert")
  ) {
    return "changed";
  }

  if (lowTitle.startsWith("delete")) {
    return "removed";
  }

  return "fixed";
}

async function run() {
  const result = execSync(`cider version`, { cwd: "./packages/app" });
  const version = result.toString().trim();

  const answer = await select({
    message: `Select bump version(current: ${version})`,
    choices: [
      {
        name: "build number",
        value: "build",
        description: "update build number",
      },
      {
        name: `patch        (${semver.inc(version, "patch")})`,
        value: "patch",
        description: "update patch version",
      },
      {
        name: `minor        (${semver.inc(version, "minor")})`,
        value: "minor",
        description: "update minor version",
      },
      {
        name: `major        (${semver.inc(version, "major")})`,
        value: "major",
        description: "update major version",
      },
    ],
  });

  execSync(`cider bump ${answer}`, { cwd: "./packages/app" });

  const newResult = execSync(`cider version`, { cwd: "./packages/app" });
  const newVersion = newResult.toString().trim();

  console.log(`info bump version to v${newVersion}`);
  execSync(`git tag -a "v${newVersion}" -m "bump version"`);

  console.log(`create tag v${newVersion}`);
  execSync(`cider release`, {
    cwd: "./packages/app",
  });
  try {
    const prResult = execSync(
      `git log v${version}..v${newVersion} --merges --pretty=format:"%h %s" | grep -Eo "#[0-9]+"`
    );
    prResult
      .toString()
      .trim()
      .split("\n")
      .forEach((pr) => {
        const id = pr.substring(1);
        const result = execSync(`gh pr view ${id} --json title`)
          .toString()
          .trim();
        const { title } = JSON.parse(result);
        const line = `cider log ${getLogType(
          title
        )} '[${id}](https://github.com/ueki-tomohiro/build_network_setting/pull/${id}) ${title}'`;
        console.log(line);
        execSync(line, {
          cwd: "./packages/app",
        });
      });
  } catch (e) {
    console.log("update note error");
  }
}

run();
