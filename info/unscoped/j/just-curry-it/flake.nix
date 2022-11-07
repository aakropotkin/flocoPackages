{

  inputs.packument.url   = "https://registry.npmjs.org/just-curry-it?rev=31-f47415ddfced4c448f296d6e8be42c02";
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
    ident = "just-curry-it";
    ldir  = "info/unscoped/j/just-curry-it";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
