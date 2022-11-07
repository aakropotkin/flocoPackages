{

  inputs.packument.url   = "https://registry.npmjs.org/collection-map?rev=6-3dc40855158c57c01b61358f01f296a6";
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
    ident = "collection-map";
    ldir  = "info/unscoped/c/collection-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
