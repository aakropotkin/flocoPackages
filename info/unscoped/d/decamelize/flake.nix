{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/decamelize?_rev=29-dfb289d0613104f875698d8761fb164e";
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
    ident = "decamelize";
    ldir  = "info/unscoped/d/decamelize";
    inherit packument fetchInfo;
  } // latest';

}
