{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/promise-call-limit?_rev=2-8399f7bd3e0322a854b24ec1a0d94008";
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
    ident = "promise-call-limit";
    ldir  = "info/unscoped/p/promise-call-limit";
    inherit packument fetchInfo;
  } // latest';

}
