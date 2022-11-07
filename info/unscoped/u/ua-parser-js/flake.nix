{

  inputs.packument.url   = "https://registry.npmjs.org/ua-parser-js?rev=158-a660a260ba252a25f9970d5ac78c5705";
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
    ident = "ua-parser-js";
    ldir  = "info/unscoped/u/ua-parser-js";
    inherit packument fetchInfo;
  } // latest';

}
