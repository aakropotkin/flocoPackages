{

  inputs.packument.url   = "https://registry.npmjs.org/username-sync?rev=6-e76ae4751115e129d62fd6b7333b6be4";
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
    ident = "username-sync";
    ldir  = "info/unscoped/u/username-sync";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
