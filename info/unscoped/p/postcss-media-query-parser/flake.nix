{

  inputs.packument.url   = "https://registry.npmjs.org/postcss-media-query-parser?rev=9-820de48ae81d35b95062a37a6ea0e749";
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
    ident = "postcss-media-query-parser";
    ldir  = "info/unscoped/p/postcss-media-query-parser";
    inherit packument fetchInfo;
  } // latest';

}
