{

  inputs.packument.url   = "https://registry.npmjs.org/@svgr/babel-plugin-svg-em-dimensions";
  inputs.packument.flake = false;
  inputs.treeLock.url    = "path:../../../registry/@svgr/babel-plugin-svg-em-dimensions.json";
  inputs.treeLock.flake  = false;

  # BEGIN INJECTED INPUTS
  # Do not write anything between these lines.
  # @INJECT_INPUTS@
  # END INJECTED INPUTS

  outputs = { packument, treeLock, at-node-nix, ... } @ inputs: let
    inherit (at-node-nix) lib;
    packument = lib.importJSON inputs.packument;
  in {

    inherit packument;
    treeLock = lib.importJSON inputs.treeLock;
    latest   = lib.libreg.packumentLatestVersion packument;

  };

}
