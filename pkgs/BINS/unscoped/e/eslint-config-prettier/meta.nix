{ version }: {

  bin = if 0 <= ( builtins.compareVersions "1.0.3" version ) then {
    eslint-config-prettier-check = "cli.js";
  } else if 0 < ( builtins.compareVersions "7" version ) then {
    eslint-config-prettier-check = "bin/cli.js";
  } else {
    eslint-config-prettier = "bin/cli.js";
  };

}
