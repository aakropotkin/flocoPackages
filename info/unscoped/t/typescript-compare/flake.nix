{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/typescript-compare?_rev=3-bf7aaae7ff554f146f31640f8baec7fa";
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
    ident = "typescript-compare";
    ldir  = "info/unscoped/t/typescript-compare";
    inherit packument fetchInfo;
  } // latest';

}
