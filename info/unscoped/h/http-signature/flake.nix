{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/http-signature?_rev=82-fc76206656548baf5b17b53aa39697e0";
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
    ident = "http-signature";
    ldir  = "info/unscoped/h/http-signature";
    inherit packument fetchInfo;
  } // latest';

}
