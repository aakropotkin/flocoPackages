{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ws?_rev=619-facd0e5cf574ec1f5f38ae0f987bb5fe";
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
    ident = "ws";
    ldir  = "info/unscoped/w/ws";
    inherit packument fetchInfo;
  } // latest';

}
