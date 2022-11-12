{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-docker?_rev=13-1e8d55db0fae0c430e493b7a00d0ee88";
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
    ident = "is-docker";
    ldir  = "info/unscoped/i/is-docker";
    inherit packument fetchInfo;
  } // latest';

}
