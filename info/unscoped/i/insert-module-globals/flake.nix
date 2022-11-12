{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/insert-module-globals?_rev=160-3d83bb875b2db6c69090e57a1630b4cd";
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
    ident = "insert-module-globals";
    ldir  = "info/unscoped/i/insert-module-globals";
    inherit packument fetchInfo;
  } // latest';

}
