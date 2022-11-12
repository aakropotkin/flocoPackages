{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/language-tags?_rev=23-7ab2634c6e18b9dfa19cd472abe46049";
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
    ident = "language-tags";
    ldir  = "info/unscoped/l/language-tags";
    inherit packument fetchInfo;
  } // latest';

}
