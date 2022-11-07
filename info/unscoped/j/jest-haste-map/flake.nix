{

  inputs.packument.url   = "https://registry.npmjs.org/jest-haste-map?rev=380-2acd8040ea242848d13fa7bfaba61b39";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "jest-haste-map";
    ldir  = "info/unscoped/j/jest-haste-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
