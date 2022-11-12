{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/unset-value?_rev=11-5a13b5dc3b77c74e7315ee6caf448c42";
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
    ident = "unset-value";
    ldir  = "info/unscoped/u/unset-value";
    inherit packument fetchInfo;
  } // latest';

}
