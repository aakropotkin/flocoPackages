{ version }: {
  binInfo.binPairs = if 0 <= ( builtins.compareVersions "0.1.4" version ) then {
    css-blank-pseudo = "cli.js";
  } else if 0 < ( builtins.compareVersions "3.0.0" version ) then {
    css-blank-pseudo = "dist/cli.js";
  } else if 0 < ( builtins.compareVersions "3.0.2" version ) then {
    css-blank-pseudo = "dist/cli.mjs";
  } else { /* They just release a module after that, no bins */ };
}
