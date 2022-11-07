{

  inputs.packument.url   = "https://registry.npmjs.org/tinycolor2?rev=42-3b84387a11b87bfb5528cfce2e41a8af";
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
    ident = "tinycolor2";
    ldir  = "info/unscoped/t/tinycolor2";
    inherit packument fetchInfo;
  } // latest';

}
