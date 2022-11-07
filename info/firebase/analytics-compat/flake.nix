{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/analytics-compat?rev=500-815923325689bbd0c9957d9147b0551d";
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
    ident = "@firebase/analytics-compat";
    ldir  = "info/firebase/analytics-compat";
    inherit packument fetchInfo;
  } // latest';

}
