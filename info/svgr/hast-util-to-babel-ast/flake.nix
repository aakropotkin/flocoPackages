{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@svgr%2fhast-util-to-babel-ast?_rev=22-747f34be3830313d9692ae1380171ac8";
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
    ident = "@svgr/hast-util-to-babel-ast";
    ldir  = "info/svgr/hast-util-to-babel-ast";
    inherit packument fetchInfo;
  } // latest';

}
