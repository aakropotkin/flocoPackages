{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pretty-hrtime?_rev=33-8915f06aebf25e3ff1a6ecb59887dbcb";
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
    ident = "pretty-hrtime";
    ldir  = "info/unscoped/p/pretty-hrtime";
    inherit packument fetchInfo;
  } // latest';

}
