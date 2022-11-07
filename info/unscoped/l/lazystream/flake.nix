{

  inputs.packument.url   = "https://registry.npmjs.org/lazystream?rev=11-acfad1cc997f7a5521de7a8d45c44021";
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
    ident = "lazystream";
    ldir  = "info/unscoped/l/lazystream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
