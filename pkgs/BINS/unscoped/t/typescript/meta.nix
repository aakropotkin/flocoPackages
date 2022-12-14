{ version }: {

  binInfo.binPairs = let
    extra = if 0 < ( builtins.compareVersions "1.5.0" version ) then {} else {
      tsserver = "bin/tsserver";
    };
  in { tsc = "bin/tsc"; } // extra;

}
