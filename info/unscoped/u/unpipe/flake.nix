{

  inputs.packument.url   = "https://registry.npmjs.org/unpipe?rev=5-849790a164f03a428808d7de8b3e853d";
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
    ident = "unpipe";
    ldir  = "info/unscoped/u/unpipe";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
