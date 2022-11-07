{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-media-minmax?rev=19-8b7e572927a309b7b33abcd263f3ebed";
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
    ident = "postcss-media-minmax";
    ldir  = "info/unscoped/p/postcss-media-minmax";
    inherit packument fetchInfo;
  } // latest';

}
