{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/size-sensor?_rev=18-8cbf4700235c51309b41f193f7e5c0b0";
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
    ident = "size-sensor";
    ldir  = "info/unscoped/s/size-sensor";
    inherit packument fetchInfo;
  } // latest';

}
