{

  inputs.packument.url   = "https://registry.npmjs.org/JSONStream?rev=204-9b68aeec3cd5f59c12151ce8816c4ea0";
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
    ident = "JSONStream";
    ldir  = "info/unscoped/J/JSONStream";
    inherit packument fetchInfo;
  } // latest';

}
