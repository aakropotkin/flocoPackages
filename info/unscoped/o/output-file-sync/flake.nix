{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/output-file-sync?_rev=14-3129d759cab21fedca158a88c419ad79";
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
    ident = "output-file-sync";
    ldir  = "info/unscoped/o/output-file-sync";
    inherit packument fetchInfo;
  } // latest';

}
