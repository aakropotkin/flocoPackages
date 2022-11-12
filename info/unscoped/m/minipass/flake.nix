{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/minipass?_rev=104-d28f6d92c38cc39a12f4975f41194431";
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
    ident = "minipass";
    ldir  = "info/unscoped/m/minipass";
    inherit packument fetchInfo;
  } // latest';

}
