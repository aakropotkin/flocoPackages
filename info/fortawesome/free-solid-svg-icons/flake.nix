{

  inputs.packument.url   = "https://registry.npmjs.org/@fortawesome/free-solid-svg-icons";
  inputs.packument.flake = false;
  inputs.treeLock.url    = "path:../../../registry/@fortawesome/free-solid-svg-icons.json";
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
