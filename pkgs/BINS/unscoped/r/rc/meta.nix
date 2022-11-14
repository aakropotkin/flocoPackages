{ version }: {

  bin = if 0 <= ( builtins.compareVersions "1.1.2" version ) then {
    rc = "index.js";
  } else {
    rc = "cli.js";
  };

}
