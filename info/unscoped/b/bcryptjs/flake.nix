{

  inputs.packument.url   = "https://registry.npmjs.org/bcryptjs?rev=254-3b9fa6b4a8fe3f5c3dce8514b65a178c";
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
    ident = "bcryptjs";
    ldir  = "info/unscoped/b/bcryptjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
