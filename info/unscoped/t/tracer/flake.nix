{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tracer?_rev=142-5ab97c8d16a4868a498fb4bfff865696";
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
    ident = "tracer";
    ldir  = "info/unscoped/t/tracer";
    inherit packument fetchInfo;
  } // latest';

}
