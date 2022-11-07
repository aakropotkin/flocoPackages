{

  inputs.packument.url   = "https://registry.npmjs.org/@types/react-visibility-sensor?rev=178-a8b14256f8e215904d35bfcd91c6a11e";
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
    scope = "@types";
    ident = "@types/react-visibility-sensor";
    ldir  = "info/types/react-visibility-sensor";
    inherit packument fetchInfo;
  } // latest';

}
