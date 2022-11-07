{

  inputs.packument.url   = "https://registry.npmjs.org/cryptiles?rev=108-cc926cb272eb43755891d631c28bab84";
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
    ident = "cryptiles";
    ldir  = "info/unscoped/c/cryptiles";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
