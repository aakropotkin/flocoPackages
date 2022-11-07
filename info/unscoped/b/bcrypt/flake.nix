{

  inputs.packument.url   = "https://registry.npmjs.org/bcrypt?rev=508-56e801b5a9d67360b40075723488f033";
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
    ident = "bcrypt";
    ldir  = "info/unscoped/b/bcrypt";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
