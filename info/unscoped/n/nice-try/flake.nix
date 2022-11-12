{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nice-try?_rev=14-28e1e4924b014b4e045180aa3b4104d9";
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
    ident = "nice-try";
    ldir  = "info/unscoped/n/nice-try";
    inherit packument fetchInfo;
  } // latest';

}
