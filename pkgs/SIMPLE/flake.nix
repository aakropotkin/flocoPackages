{
  outputs = { ... } @ inputs: let
    flocoLock   = builtins.fromJSON ( builtins.readFile ../../flake.lock );
    annSi       = flocoLock.nodes.at-node-nix.locked;
    annUri      = "github:aameen-tulip/at-node-nix/${annSi.rev}";
    at-node-nix = builtins.getFlake annUri;
    overlays = {
      default = at-node-nix.lib.composeExtensions
                  at-node-nix.overlays.default
                  overlays.simple-latest;
      simple-latest = final: prev: import ./overlay.nix;
    };
  in {  # Begin Outputs
    inherit overlays;    
  };  # End Outputs
}
