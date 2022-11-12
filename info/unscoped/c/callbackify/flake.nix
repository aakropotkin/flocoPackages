{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/callbackify?_rev=20-1f314f47536927b1813da2ae5b2610a2";
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
    ident = "callbackify";
    ldir  = "info/unscoped/c/callbackify";
    inherit packument fetchInfo;
  } // latest';

}
