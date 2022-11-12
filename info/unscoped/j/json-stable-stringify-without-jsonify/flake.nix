{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/json-stable-stringify-without-jsonify?_rev=3-fadb616780bf85bd2945fce48a44abe6";
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
    ident = "json-stable-stringify-without-jsonify";
    ldir  = "info/unscoped/j/json-stable-stringify-without-jsonify";
    inherit packument fetchInfo;
  } // latest';

}
