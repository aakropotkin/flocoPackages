{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-color-rgb?rev=9-83a7d3c606166d45de64eb0be4af8490";
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
    ident = "postcss-color-rgb";
    ldir  = "info/unscoped/p/postcss-color-rgb";
    inherit packument fetchInfo;
  } // latest';

}
