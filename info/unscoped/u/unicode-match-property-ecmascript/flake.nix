{

  inputs.packument.url   = "https://registry.npmjs.org/unicode-match-property-ecmascript?rev=9-8c8456b56d5d1ec3c07d66000a0f1ced";
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
    ident = "unicode-match-property-ecmascript";
    ldir  = "info/unscoped/u/unicode-match-property-ecmascript";
    inherit packument fetchInfo;
  } // latest';

}
