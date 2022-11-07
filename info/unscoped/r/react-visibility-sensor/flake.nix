{

  inputs.packument.url   = "https://registry.npmjs.org/react-visibility-sensor?rev=69-511a756a12ef707f1f88a9e9d1904603";
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
    ident = "react-visibility-sensor";
    ldir  = "info/unscoped/r/react-visibility-sensor";
    inherit packument fetchInfo;
  } // latest';

}
