{

  inputs.packument.url   = "https://registry.npmjs.org/node-emoji?rev=66-61cb820c6a47ee8f5434ee5b2487b666";
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
    ident = "node-emoji";
    ldir  = "info/unscoped/n/node-emoji";
    inherit packument fetchInfo;
  } // latest';

}
