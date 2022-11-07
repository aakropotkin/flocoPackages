{

  inputs.packument.url   = "https://registry.npmjs.org/js-base64?rev=116-50bca359c939212b4d5537c83bbe2b5c";
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
    ident = "js-base64";
    ldir  = "info/unscoped/j/js-base64";
    inherit packument fetchInfo;
  } // latest';

}
