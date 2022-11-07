{

  inputs.packument.url   = "https://registry.npmjs.org/unicode-canonical-property-names-ecmascript?rev=9-6c40fe4b13fc619ade78dd05e85a06e2";
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
    ident = "unicode-canonical-property-names-ecmascript";
    ldir  = "info/unscoped/u/unicode-canonical-property-names-ecmascript";
    inherit packument fetchInfo;
  } // latest';

}
