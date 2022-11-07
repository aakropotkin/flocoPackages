{

  inputs.packument.url   = "https://registry.npmjs.org/draft-js?rev=71-cdfff0954bc953e2e5f8067bde7d3d5a";
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
    ident = "draft-js";
    ldir  = "info/unscoped/d/draft-js";
    inherit packument fetchInfo;
  } // latest';

}
