{

  inputs.packument.url   = "https://registry.npmjs.org/unicode-match-property-value-ecmascript?rev=9-39837eb9f614d7802d6841011f1847a6";
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
    ident = "unicode-match-property-value-ecmascript";
    ldir  = "info/unscoped/u/unicode-match-property-value-ecmascript";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
