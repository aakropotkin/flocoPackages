{

  inputs.packument.url   = "https://registry.npmjs.org/@svgr/plugin-jsx?rev=32-eb9dfce0d570d8f36e9294ea4b483cc3";
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
    ident = "@svgr/plugin-jsx";
    ldir  = "info/svgr/plugin-jsx";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
