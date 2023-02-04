#! /usr/bin/env bash
echo -e "{\n  imports = [\n$(
  find . -mindepth 2 -maxdepth 2 -name default.nix -printf '    %h\n';
)\n  ];\n}"
