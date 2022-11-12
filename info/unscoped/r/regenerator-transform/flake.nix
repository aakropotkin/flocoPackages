{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/regenerator-transform?_rev=38-053201e04f41034488854142435113cd";
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
    ident = "regenerator-transform";
    ldir  = "info/unscoped/r/regenerator-transform";
    inherit packument fetchInfo;
  } // latest';

}
