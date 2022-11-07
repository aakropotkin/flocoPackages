{

  inputs.packument.url   = "https://registry.npmjs.org/jest-environment-node?rev=391-49de080b596a8d3dda63da43d44fe939";
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
    ident = "jest-environment-node";
    ldir  = "info/unscoped/j/jest-environment-node";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
