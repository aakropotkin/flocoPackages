# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

final: prev: let

# ---------------------------------------------------------------------------- #

  callLibWith = { lib ? final, ... } @ auto: x: let
    f    = if prev.isFunction x then x else import x;
    args = builtins.intersectAttrs ( builtins.functionArgs f )
                                    ( { inherit lib; } // auto );
  in f args;
  callLibsWith = auto: lst:
    builtins.foldl' ( acc: x: acc // ( callLibWith auto x ) ) {} lst;
  callLib  = callLibWith {};
  callLibs = callLibsWith {};

in {  # Begin Exports

  weeklyDlCount = import ./downloadCount.nix;

}  # End Lib Overlay


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
