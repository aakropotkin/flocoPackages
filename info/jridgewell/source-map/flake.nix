{

  inputs.packument.url   = "https://registry.npmjs.org/@jridgewell/source-map?rev=2-60bdd3d10cf362a6bb175dde94f13b37";
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
    scope = "@jridgewell";
    ident = "@jridgewell/source-map";
    ldir  = "info/jridgewell/source-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
