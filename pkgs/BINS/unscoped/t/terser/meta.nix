{ version }: {

  bin = if version == "3.7.1" then {
    uglifyjs = "bin/uglifyjs";
  } else if ( builtins.compareVersions "4.3.0" version ) <= 0 then {
    terser = "bin/terser";
  } else {
    terser = "bin/uglifyjs";
  };

}
