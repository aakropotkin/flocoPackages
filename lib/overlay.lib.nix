# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  callLibWith = { lib ? final, ... } @ auto: x: let
    f    = if prev.lib.isFunction x then x else import x;
    args = builtins.intersectAttrs ( builtins.functionArgs f )
                                    ( { inherit lib; } // auto );
  in f args;
  callLibsWith = auto: lst:
    builtins.foldl' ( acc: x: acc // ( callLibWith auto x ) ) {} lst;
  callLib  = callLibWith {};
  callLibs = callLibsWith {};

in {  # Begin Exports

  flocoConfig = let
    j = prev.importJSON ../config/flocoConfig.json;
    m = prev.recursiveUpdate j ( prev.flocoConfig or {} );
  in prev.libcfg.mkFlocoConfig m;

}  # End Lib Overlay


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
