{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-clamp?rev=8-f4933ce7ece3c46680d540760e08a8f4";
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
    ident = "postcss-clamp";
    ldir  = "info/unscoped/p/postcss-clamp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
