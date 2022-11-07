{

  inputs.packument.url   = "https://registry.npmjs.org/pngjs?rev=54-61d5c238bbc2bcd4ef1deeb08cf3c57b";
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
    ident = "pngjs";
    ldir  = "info/unscoped/p/pngjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
