{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/bulma?_rev=98-2cbcbcb72d97c3214b92485755c9c277";
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
    ident = "bulma";
    ldir  = "info/unscoped/b/bulma";
    inherit packument fetchInfo;
  } // latest';

}
