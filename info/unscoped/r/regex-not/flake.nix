{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/regex-not?_rev=11-eff556e665dcf945462152514b862122";
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
    ident = "regex-not";
    ldir  = "info/unscoped/r/regex-not";
    inherit packument fetchInfo;
  } // latest';

}
