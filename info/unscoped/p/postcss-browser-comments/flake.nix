{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-browser-comments?rev=4-482b6b839066e43751e59ca6f34b0849";
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
    ident = "postcss-browser-comments";
    ldir  = "info/unscoped/p/postcss-browser-comments";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
