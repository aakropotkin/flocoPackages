{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/nearley?_rev=136-aa094e805184543202a033a171b310b9";
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
    ident = "nearley";
    ldir  = "info/unscoped/n/nearley";
    inherit packument fetchInfo;
  } // latest';

}
