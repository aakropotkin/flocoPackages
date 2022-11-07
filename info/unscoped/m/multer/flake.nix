{

  inputs.packument.url   = "https://registry.npmjs.org/multer?rev=382-58b214d8b7929f4f043906d0ba41db4d";
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
    ident = "multer";
    ldir  = "info/unscoped/m/multer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
