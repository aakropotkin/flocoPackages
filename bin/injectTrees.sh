#! /usr/bin/env bash
set -eu;
set -o pipefail;
nix eval --impure --expr 'let
  floco = builtins.getFlake "github:aakropotkin/floco";
  mod   = floco.lib.evalModules {
    modules = [
      floco.nixosModules.default
      ./floco-cfg.nix
      { config.floco.buildPlan.deriveTreeInfo = floco.lib.mkDefault true; }
    ];
  };
  ex = builtins.mapAttrs ( ident:
         ( builtins.mapAttrs ( version: v: v._export ) )
       ) mod.config.floco.pdefs;
in { floco.pdefs = ex; }
'|nixfmt|tee pdefs.nix~ && mv ./pdefs.nix{~,};
