{ version }: {

  bin = if 0 < ( builtins.compareVersions "6.2.0" version ) then {
    semver = "bin/semver";
  } else {
    semver = "bin/semver.js";
  };

}
