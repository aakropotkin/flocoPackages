{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sshpk?_rev=88-afadea5ce898b0fdba7d2eb4c2eb8df3";
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
    ident = "sshpk";
    ldir  = "info/unscoped/s/sshpk";
    inherit packument fetchInfo;
  } // latest';

}
