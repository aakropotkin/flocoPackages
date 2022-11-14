{ version }: {

  bin = if ( builtins.compareVersions "1.10.1" version ) <= 0 then {
    prettier = "bin/prettier.cjs";
  } else {
    prettier = "bin-prettier.js";
  };

}
