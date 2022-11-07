{

  inputs.packument.url   = "https://registry.npmjs.org/snapdragon-util?rev=20-955bbd5b86bc6df0010d8852b7329205";
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
    ident = "snapdragon-util";
    ldir  = "info/unscoped/s/snapdragon-util";
    inherit packument fetchInfo;
  } // latest';

}
