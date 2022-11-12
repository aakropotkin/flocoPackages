{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/flux?_rev=128-3a975790646c6c9a60c71cc22f740ab1";
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
    ident = "flux";
    ldir  = "info/unscoped/f/flux";
    inherit packument fetchInfo;
  } // latest';

}
