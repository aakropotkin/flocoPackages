{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/better-assert?_rev=30-09e7305e54a4335abcdca5e44fa91275";
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
    ident = "better-assert";
    ldir  = "info/unscoped/b/better-assert";
    inherit packument fetchInfo;
  } // latest';

}
