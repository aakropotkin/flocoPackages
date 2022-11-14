{ version }: {

  bin = let
    gtl = 0 <= ( builtins.compareVersions "2.2.0" version );
    lth = ( builtins.compareVersions "4.0.3" version ) <= 0;
  in if gtl && lth then { pino = "pretty.js"; } else { pino = "bin.js"; };

}
