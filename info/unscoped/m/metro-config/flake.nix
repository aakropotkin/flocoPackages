{

  inputs.packument.url   = "https://registry.npmjs.org/metro-config?rev=77-3949c09c0ec16af157c16a71e1eba74a";
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
    ident = "metro-config";
    ldir  = "info/unscoped/m/metro-config";
    inherit packument fetchInfo;
  } // latest';

}
