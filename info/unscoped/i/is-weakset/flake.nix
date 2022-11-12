{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-weakset?_rev=12-7fa78e15ca7cb80613b6b2e5faa05d5a";
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
    ident = "is-weakset";
    ldir  = "info/unscoped/i/is-weakset";
    inherit packument fetchInfo;
  } // latest';

}
