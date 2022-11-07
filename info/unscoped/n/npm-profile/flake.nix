{

  inputs.packument.url   = "https://registry.npmjs.org/npm-profile?rev=63-44aacae330fbc1f039f7ad2d0cd57e75";
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
    ident = "npm-profile";
    ldir  = "info/unscoped/n/npm-profile";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
