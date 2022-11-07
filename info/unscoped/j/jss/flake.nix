{

  inputs.packument.url   = "https://registry.npmjs.org/jss?rev=275-fa049a17278028a5f585dc0e51174594";
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
    ident = "jss";
    ldir  = "info/unscoped/j/jss";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
