{

  inputs.packument.url   = "https://registry.npmjs.org/bcrypt-pbkdf?rev=36-1813af753f7bd459411f7b54d76c5f74";
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
    ident = "bcrypt-pbkdf";
    ldir  = "info/unscoped/b/bcrypt-pbkdf";
    inherit packument fetchInfo;
  } // latest';

}
