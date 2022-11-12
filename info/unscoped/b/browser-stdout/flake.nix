{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browser-stdout?_rev=15-4c8d3aac18e105f18c9fba5150513807";
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
    ident = "browser-stdout";
    ldir  = "info/unscoped/b/browser-stdout";
    inherit packument fetchInfo;
  } // latest';

}
