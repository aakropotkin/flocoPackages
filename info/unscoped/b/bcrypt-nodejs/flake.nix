{

  inputs.packument.url   = "https://registry.npmjs.org/bcrypt-nodejs?rev=152-e3975e1056f5c32510f91f39c417c61a";
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
    ident = "bcrypt-nodejs";
    ldir  = "info/unscoped/b/bcrypt-nodejs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
