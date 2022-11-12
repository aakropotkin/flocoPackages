{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/min-document?_rev=90-798b655d5970eae076e5266e48d05c90";
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
    ident = "min-document";
    ldir  = "info/unscoped/m/min-document";
    inherit packument fetchInfo;
  } // latest';

}
