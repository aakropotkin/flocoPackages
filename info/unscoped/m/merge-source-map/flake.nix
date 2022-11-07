{

  inputs.packument.url   = "https://registry.npmjs.org/merge-source-map?rev=9-bfaecebb156d5f4c8e4f4bf70fa5413c";
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
    ident = "merge-source-map";
    ldir  = "info/unscoped/m/merge-source-map";
    inherit packument fetchInfo;
  } // latest';

}
