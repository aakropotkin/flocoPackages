{

  inputs.packument.url   = "https://registry.npmjs.org/metro-source-map?rev=124-6356a2320e30edca71036e976a7f81fc";
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
    ident = "metro-source-map";
    ldir  = "info/unscoped/m/metro-source-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
