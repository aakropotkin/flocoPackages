{

  inputs.packument.url   = "https://registry.npmjs.org/seek-bzip?rev=25-3e8e107806c613d7327cb1f5b820e86c";
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
    ident = "seek-bzip";
    ldir  = "info/unscoped/s/seek-bzip";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
