{

  inputs.packument.url   = "https://registry.npmjs.org/pm2-multimeter?rev=9-5d7efd2fa0d8e70bf1ac835c00af012d";
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
    ident = "pm2-multimeter";
    ldir  = "info/unscoped/p/pm2-multimeter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
