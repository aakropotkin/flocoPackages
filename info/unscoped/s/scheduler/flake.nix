{

  inputs.packument.url   = "https://registry.npmjs.org/scheduler?rev=1170-00b8bdf781c301e2b9419566cfcbec33";
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
    ident = "scheduler";
    ldir  = "info/unscoped/s/scheduler";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
