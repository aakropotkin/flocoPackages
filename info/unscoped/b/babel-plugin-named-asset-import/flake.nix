{

  inputs.packument.url   = "https://registry.npmjs.org/babel-plugin-named-asset-import?rev=48-edf451e8f993aa490a1225bccdcb7905";
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
    ident = "babel-plugin-named-asset-import";
    ldir  = "info/unscoped/b/babel-plugin-named-asset-import";
    inherit packument fetchInfo;
  } // latest';

}
