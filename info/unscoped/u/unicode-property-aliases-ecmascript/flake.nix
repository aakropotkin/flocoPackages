{

  inputs.packument.url   = "https://registry.npmjs.org/unicode-property-aliases-ecmascript";
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
    ident = "unicode-property-aliases-ecmascript";
    ldir  = "info/unscoped/u/unicode-property-aliases-ecmascript";
    inherit packument fetchInfo;
  } // latest';

}
