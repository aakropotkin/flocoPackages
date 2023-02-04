#! /usr/bin/env bash
nix eval --impure --expr 'let
  floco = builtins.getFlake "floco";
  mod   = floco.lib.evalModules {
    modules = [
      floco.nixosModules.default
      ./floco-cfg.nix
    ];
  };
  ex = builtins.mapAttrs ( ident:
         ( builtins.mapAttrs ( version: v: v._export ) )
       ) mod.config.floco.pdefs;
in { floco.pdefs = ex; }
'|nixfmt|tee pdefs.nix~ && mv ./pdefs.nix{~,};
