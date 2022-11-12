{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@humanwhocodes%2fmodule-importer?_rev=1-597456d7b40899f494f05043ee149d01";
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
    scope = "@humanwhocodes";
    ident = "@humanwhocodes/module-importer";
    ldir  = "info/humanwhocodes/module-importer";
    inherit packument fetchInfo;
  } // latest';

}
