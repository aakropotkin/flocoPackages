{

  inputs.packument.url   = "https://registry.npmjs.org/pm2-deploy?rev=38-5f5bcbe1a9ab1248707d26814a30e543";
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
    ident = "pm2-deploy";
    ldir  = "info/unscoped/p/pm2-deploy";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
