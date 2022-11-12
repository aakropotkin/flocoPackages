{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ts-loader?_rev=215-85113c57c0803045e39f4a6894f3fda4";
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
    ident = "ts-loader";
    ldir  = "info/unscoped/t/ts-loader";
    inherit packument fetchInfo;
  } // latest';

}
