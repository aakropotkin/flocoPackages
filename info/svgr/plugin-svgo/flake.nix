{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@svgr/plugin-svgo?_rev=21-ad9ab5308dcbeee33c1d8fda2a98a972";
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
    scope = "@svgr";
    ident = "@svgr/plugin-svgo";
    ldir  = "info/svgr/plugin-svgo";
    inherit packument fetchInfo;
  } // latest';

}
