{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-color-hex-alpha?rev=29-8c144169cac641975eea8052ea3f1b58";
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
    ident = "postcss-color-hex-alpha";
    ldir  = "info/unscoped/p/postcss-color-hex-alpha";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
