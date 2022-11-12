{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ts-mocha?_rev=24-45bfbe42a253bf294d467d8fd8f54a1a";
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
    ident = "ts-mocha";
    ldir  = "info/unscoped/t/ts-mocha";
    inherit packument fetchInfo;
  } // latest';

}
