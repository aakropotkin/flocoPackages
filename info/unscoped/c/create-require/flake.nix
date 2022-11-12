{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/create-require?_rev=7-5d9420957754098a34a283f981cda24e";
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
    ident = "create-require";
    ldir  = "info/unscoped/c/create-require";
    inherit packument fetchInfo;
  } // latest';

}
