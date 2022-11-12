{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/pkg-dir?_rev=26-8c7de184f6abc40dee40b469aba7bff3";
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
    ident = "pkg-dir";
    ldir  = "info/unscoped/p/pkg-dir";
    inherit packument fetchInfo;
  } // latest';

}
