{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mv?_rev=39-8d94f2a6c94f30153d1d5e5d1f26ae06";
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
    ident = "mv";
    ldir  = "info/unscoped/m/mv";
    inherit packument fetchInfo;
  } // latest';

}
