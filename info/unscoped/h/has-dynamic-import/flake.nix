{

  inputs.packument.url   = "https://registry.npmjs.org/has-dynamic-import?rev=5-0981d66d0e891c7720886ec7d95da22e";
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
    ident = "has-dynamic-import";
    ldir  = "info/unscoped/h/has-dynamic-import";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
