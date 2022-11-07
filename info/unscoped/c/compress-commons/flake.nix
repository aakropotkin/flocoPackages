{

  inputs.packument.url   = "https://registry.npmjs.org/compress-commons?rev=58-9261274a0094d7e209cd278cd9f406df";
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
    ident = "compress-commons";
    ldir  = "info/unscoped/c/compress-commons";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
