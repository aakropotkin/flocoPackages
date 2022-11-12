{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ms?_rev=405-d7d8a2d7f98bc9df0565a60c31a1ace1";
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
    ident = "ms";
    ldir  = "info/unscoped/m/ms";
    inherit packument fetchInfo;
  } // latest';

}
