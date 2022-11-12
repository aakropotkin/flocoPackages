{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/spdy?_rev=524-2bf96908e1f29244139caebe308e50cb";
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
    ident = "spdy";
    ldir  = "info/unscoped/s/spdy";
    inherit packument fetchInfo;
  } // latest';

}
