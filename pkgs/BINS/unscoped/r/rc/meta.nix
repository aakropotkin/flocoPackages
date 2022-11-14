{ version }: {

  bin = if ( builtins.compareVersions "1.1.2" version ) <= 0 then {
    rc = "index.js";
  } else {
    rc = "cli.js";
  };

}
