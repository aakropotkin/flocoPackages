{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/matchdep?_rev=43-efe0e899a356e29f5b6e676489c3d727";
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
    ident = "matchdep";
    ldir  = "info/unscoped/m/matchdep";
    inherit packument fetchInfo;
  } // latest';

}
