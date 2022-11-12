{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/figures?_rev=49-8e42da91897488e1302c4d9b6053a1a5";
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
    ident = "figures";
    ldir  = "info/unscoped/f/figures";
    inherit packument fetchInfo;
  } // latest';

}
