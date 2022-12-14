{ version }: {
  binInfo.binPairs =
    if 0 < ( builtins.compareVersions "3.0.0" version ) then {} else
    if 0 < ( builtins.compareVersions "7.0.0" version ) then {
      uuid = "bin/uuid";
    } else {
      uuid = "dist/bin/uuid";
    };
}
