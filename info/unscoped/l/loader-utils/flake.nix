{

  inputs.packument.url   = "https://registry.npmjs.org/loader-utils?rev=79-530efb33280b37a58403a74169752e34";
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
    ident = "loader-utils";
    ldir  = "info/unscoped/l/loader-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
