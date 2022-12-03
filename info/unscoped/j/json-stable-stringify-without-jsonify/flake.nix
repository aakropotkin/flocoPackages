{

  inputs.packument.url   = "https://registry.npmjs.org/json-stable-stringify-without-jsonify";
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
