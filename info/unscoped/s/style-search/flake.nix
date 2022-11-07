{

  inputs.packument.url   = "https://registry.npmjs.org/style-search?rev=3-473e0764b48884f8778b8fa11c26f51c";
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
    ident = "style-search";
    ldir  = "info/unscoped/s/style-search";
    inherit packument fetchInfo;
  } // latest';

}
