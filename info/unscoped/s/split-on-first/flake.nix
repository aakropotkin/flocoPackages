{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/split-on-first?_rev=5-b7c82c2feb59c476b45b63d9f4dbd556";
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
    ident = "split-on-first";
    ldir  = "info/unscoped/s/split-on-first";
    inherit packument fetchInfo;
  } // latest';

}
