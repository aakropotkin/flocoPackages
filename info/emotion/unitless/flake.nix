{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/unitless?rev=21-e0a39d0467b671648e0d749c8c3905fb";
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
    scope = "@emotion";
    ident = "@emotion/unitless";
    ldir  = "info/emotion/unitless";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
