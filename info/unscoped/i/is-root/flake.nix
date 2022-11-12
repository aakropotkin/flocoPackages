{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-root?_rev=14-360ed4c440875b8a54b878b8f90455a4";
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
    ident = "is-root";
    ldir  = "info/unscoped/i/is-root";
    inherit packument fetchInfo;
  } // latest';

}
