{ version }: {

  bin = let
    base.nearleyc = "bin/nearleyc.js";
    test' = if 0 < ( builtins.compareVersions "1.2.1" version ) then {} else {
      nearley-test = "bin/nearley-test.js";
    };
    unparse' =
      if 0 < ( builtins.compareVersions "2.0.0" version ) then {} else {
        nearley-unparse = "bin/nearley-unparse.js";
      };
    railroad' =
      if 0 < ( builtins.compareVersions "2.3.0" version ) then {} else {
        nearley-railroad = "bin/nearley-railroad.js";
      };
  in base // test' // unparse' // railroad';

}
