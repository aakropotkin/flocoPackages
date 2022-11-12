{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browser-level?_rev=2-7473959794b370cc682e1cc3d9c710f2";
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
    ident = "browser-level";
    ldir  = "info/unscoped/b/browser-level";
    inherit packument fetchInfo;
  } // latest';

}
