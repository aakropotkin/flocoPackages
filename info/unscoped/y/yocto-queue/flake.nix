{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/yocto-queue?_rev=3-33dd8aa67b7b6e2de623b1645b16706a";
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
    ident = "yocto-queue";
    ldir  = "info/unscoped/y/yocto-queue";
    inherit packument fetchInfo;
  } // latest';

}
