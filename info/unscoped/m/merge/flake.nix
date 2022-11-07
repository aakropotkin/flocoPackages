{

  inputs.packument.url   = "https://registry.npmjs.org/merge?rev=69-79a1a48976ee60afd6a2636cab625f41";
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
    ident = "merge";
    ldir  = "info/unscoped/m/merge";
    inherit packument fetchInfo;
  } // latest';

}
