{

  inputs.packument.url   = "https://registry.npmjs.org/metro-file-map?rev=15-ca51e746df475d2112edb55658ce2de0";
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
    ident = "metro-file-map";
    ldir  = "info/unscoped/m/metro-file-map";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
