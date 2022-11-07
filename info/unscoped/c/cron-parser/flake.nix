{

  inputs.packument.url   = "https://registry.npmjs.org/cron-parser?rev=129-e393292b54fd9a84388ccf130ce2467a";
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
    ident = "cron-parser";
    ldir  = "info/unscoped/c/cron-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
