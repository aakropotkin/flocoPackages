{

  inputs.packument.url   = "https://registry.npmjs.org/jest-resolve-dependencies?rev=298-13a98a4edb5819d9a9f92bb0630c56d0";
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
    ident = "jest-resolve-dependencies";
    ldir  = "info/unscoped/j/jest-resolve-dependencies";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
