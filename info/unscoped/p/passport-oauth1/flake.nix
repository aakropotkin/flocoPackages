{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/passport-oauth1?_rev=13-cce91a724bfe57f096a5a7a10215d904";
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
    ident = "passport-oauth1";
    ldir  = "info/unscoped/p/passport-oauth1";
    inherit packument fetchInfo;
  } // latest';

}
