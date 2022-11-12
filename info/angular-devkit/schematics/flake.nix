{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@angular-devkit/schematics?_rev=598-53eb6d8723d670155bd4d60df1138571";
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
    scope = "@angular-devkit";
    ident = "@angular-devkit/schematics";
    ldir  = "info/angular-devkit/schematics";
    inherit packument fetchInfo;
  } // latest';

}
