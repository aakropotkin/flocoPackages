{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/messaging-compat?rev=506-6708e88304da695bbff0b7324740c4f3";
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
    scope = "@firebase";
    ident = "@firebase/messaging-compat";
    ldir  = "info/firebase/messaging-compat";
    inherit packument fetchInfo;
  } // latest';

}
