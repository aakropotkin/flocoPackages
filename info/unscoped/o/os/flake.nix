{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/os?_rev=14-082e0b515b84d71557d06935f8414c97";
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
    ident = "os";
    ldir  = "info/unscoped/o/os";
    inherit packument fetchInfo;
  } // latest';

}
