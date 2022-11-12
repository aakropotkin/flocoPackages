{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sparkles?_rev=21-8614ab3defe109b146ec2e027d7cf981";
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
    ident = "sparkles";
    ldir  = "info/unscoped/s/sparkles";
    inherit packument fetchInfo;
  } // latest';

}
