{

  inputs.packument.url   = "https://registry.npmjs.org/url-loader?rev=140-98eacd2ecc5a84baa7dcee897549e8a5";
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
    ident = "url-loader";
    ldir  = "info/unscoped/u/url-loader";
    inherit packument fetchInfo;
  } // latest';

}
