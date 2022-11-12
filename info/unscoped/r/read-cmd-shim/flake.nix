{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/read-cmd-shim?_rev=35-166465f36a540491bddb244d67d37344";
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
    ident = "read-cmd-shim";
    ldir  = "info/unscoped/r/read-cmd-shim";
    inherit packument fetchInfo;
  } // latest';

}
