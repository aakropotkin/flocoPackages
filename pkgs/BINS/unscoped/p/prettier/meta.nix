{ version }: {

  binInfo.binPairs = if 0 < ( builtins.compareVersions "1.10.1" version ) then {
    prettier = "bin/prettier.cjs";
  } else {
    prettier = "bin-prettier.js";
  };

}
