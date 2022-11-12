{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-hex-prefixed?_rev=3-5d4384bb3931ccdd9960e0719a0f2bf1";
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
    ident = "is-hex-prefixed";
    ldir  = "info/unscoped/i/is-hex-prefixed";
    inherit packument fetchInfo;
  } // latest';

}
