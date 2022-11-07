{

  inputs.packument.url   = "https://registry.npmjs.org/grunt-legacy-util?rev=20-3d49e718d7e3a9a23e9b0f1cedc7cea5";
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
    ident = "grunt-legacy-util";
    ldir  = "info/unscoped/g/grunt-legacy-util";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
