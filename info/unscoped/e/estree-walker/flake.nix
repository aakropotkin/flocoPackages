{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/estree-walker?_rev=29-000b93145b1ba60fd29aef088b975159";
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
    ident = "estree-walker";
    ldir  = "info/unscoped/e/estree-walker";
    inherit packument fetchInfo;
  } // latest';

}
