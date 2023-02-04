#! /usr/bin/env bash
echo -e "{\n  imports = [\n$(
  find . -name floco-cfg.nix -printf '    %p\n';
)\n  ];\n}";
