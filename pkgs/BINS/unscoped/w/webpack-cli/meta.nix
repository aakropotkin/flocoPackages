{ version }: {

  binInfo.binPairs = if 0 < ( builtins.compareVersions "3.0.0" version ) then {
    webpack-cli = "bin/webpack.js";
  } else if 0 < ( builtins.compareVersions "4.0.0" version ) then {
    webpack-cli = "bin/cli.js";
  } else {
    webpack-cli = "cli.js";
  };

}
