{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-negated-glob?_rev=5-e37a71cdc35ebfa767721dc3a3edc700";
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
    ident = "is-negated-glob";
    ldir  = "info/unscoped/i/is-negated-glob";
    inherit packument fetchInfo;
  } // latest';

}
