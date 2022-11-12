{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/blessed?_rev=280-8e600231c42980a273d5941553c49e6e";
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
    ident = "blessed";
    ldir  = "info/unscoped/b/blessed";
    inherit packument fetchInfo;
  } // latest';

}
