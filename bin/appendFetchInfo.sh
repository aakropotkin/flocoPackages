#!/usr/bin/env zsh

# FIXME: convert for bash
# FIXME: don't reference `~/src/flocoPackages'

add_fi_unscoped() {
  jq -s ".[0] + { \"$2\": .[1] }" ~/src/flocoPackages/info/unscoped/${1[1]}/$1/fetchInfo.json <( nix-prefetch-tree -K "https://registry.npmjs.org/$1/-/$1-$2.tgz"; )|tee ~/src/flocoPackages/info/unscoped/${1[1]}/$1/fetchInfo.json~ && mv ~/src/flocoPackages/info/unscoped/${1[1]}/$1/fetchInfo.json{~,};
}
add_fi_scoped() {
  jq -s ".[0] + { \"$3\": .[1] }" ~/src/flocoPackages/info/$1/$2/fetchInfo.json <( nix-prefetch-tree -K "https://registry.npmjs.org/@$1/$2/-/$2-$3.tgz"; )|tee ~/src/flocoPackages/info/$1/$2/fetchInfo.json~ && mv ~/src/flocoPackages/info/$1/$2/fetchInfo.json{~,};
}
