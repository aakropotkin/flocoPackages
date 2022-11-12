{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@svgr%2fwebpack?_rev=48-c786a052467e85bb22ac5709f3d320da";
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
    ident = "@svgr/webpack";
    ldir  = "info/svgr/webpack";
    inherit packument fetchInfo;
  } // latest';

}
