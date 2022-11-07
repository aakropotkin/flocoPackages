{

  inputs.packument.url   = "https://registry.npmjs.org/fclone?rev=13-971f8e22a06877d78fcb9fe17631721d";
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
    ident = "fclone";
    ldir  = "info/unscoped/f/fclone";
    inherit packument fetchInfo;
  } // latest';

}
