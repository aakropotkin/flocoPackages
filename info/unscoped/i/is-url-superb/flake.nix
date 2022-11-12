{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-url-superb?_rev=16-264f96a02b77923b0bb7ed5fd602d259";
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
    ident = "is-url-superb";
    ldir  = "info/unscoped/i/is-url-superb";
    inherit packument fetchInfo;
  } // latest';

}
