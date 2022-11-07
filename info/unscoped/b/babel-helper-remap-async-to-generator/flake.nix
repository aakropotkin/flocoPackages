{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-remap-async-to-generator?rev=117-f3d0747e7b2032bc259e7c4238e071d4";
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
    ident = "babel-helper-remap-async-to-generator";
    ldir  = "info/unscoped/b/babel-helper-remap-async-to-generator";
    inherit packument fetchInfo;
  } // latest';

}
