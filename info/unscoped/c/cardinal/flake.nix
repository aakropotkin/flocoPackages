{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cardinal?_rev=80-039aaa05036d2c5fa6ad9c6531299626";
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
    ident = "cardinal";
    ldir  = "info/unscoped/c/cardinal";
    inherit packument fetchInfo;
  } // latest';

}
