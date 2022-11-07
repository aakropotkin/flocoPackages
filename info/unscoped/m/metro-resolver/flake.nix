{

  inputs.packument.url   = "https://registry.npmjs.org/metro-resolver?rev=106-f537d2d79494fee0d7ed17325a36922c";
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
    ident = "metro-resolver";
    ldir  = "info/unscoped/m/metro-resolver";
    inherit packument fetchInfo;
  } // latest';

}
