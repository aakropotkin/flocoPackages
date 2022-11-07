{

  inputs.packument.url   = "https://registry.npmjs.org/glogg?rev=14-9fc699c87da9ff3c80b7339cc393194d";
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
    ident = "glogg";
    ldir  = "info/unscoped/g/glogg";
    inherit packument fetchInfo;
  } // latest';

}
