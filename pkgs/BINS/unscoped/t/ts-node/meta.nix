{ version }: {

  binInfo.binPairs = let
    # 1 - 3.0.4, 5 - 8.4.1
    base.ts-node = "dist/bin.js";
    # 3.0.5 - 4.1.0
    lobar' = if ( 0 < ( builtins.compareVersions "3.0.5" version ) ) ||
                ( ( builtins.compareVersions "4.1.0" version ) < 0 )
             then {}
             else { _ts-node = "dist/_bin.js"; };
    script' = if 0 < ( builtins.compareVersions "8.5.0" version ) then {} else
              if 0 < ( builtins.compareVersions "8.7.0" version ) then {
                ts-script = "dist/script.js";
              } else {
                ts-script              = "dist/bin-script-deprecated.js";
                ts-node-script         = "dist/bin-script.js";
                ts-node-transpile-only = "dist/bin-transpile.js";
              };
    cwd' = if 0 < ( builtins.compareVersions "10.0.0" version ) then {} else {
      ts-node-cwd = "dist/bin-cwd.js";
    };
    esm' = if 0 < ( builtins.compareVersions "10.7.0" version ) then {} else {
      ts-node-esm = "dist/bin-esm.js";
    };

  in base // lobar' // script' // cwd' // esm';

}
