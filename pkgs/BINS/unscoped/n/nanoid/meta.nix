{ version }: {

  binInfo.binPairs = 
    if builtins.elem version ["3.1.0" "3.1.1"] then {
      nanoid = "bin/index.js";
    } else if 0 <= ( builtins.compareVersions "4" version ) then {
      nanoid = "bin/nanoid.cjs";
    } else {
      nanoid = "bin/nanoid.js";
    };

}
