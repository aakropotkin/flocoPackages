{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/find-yarn-workspace-root2?_rev=43-115bf623c558f3e4b12ec8154a155d72";
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
    ident = "find-yarn-workspace-root2";
    ldir  = "info/unscoped/f/find-yarn-workspace-root2";
    inherit packument fetchInfo;
  } // latest';

}
