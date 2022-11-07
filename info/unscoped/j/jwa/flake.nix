{

  inputs.packument.url   = "https://registry.npmjs.org/jwa?rev=35-34ddfe1a1933ef8a75aeebbf888fcfe5";
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
    ident = "jwa";
    ldir  = "info/unscoped/j/jwa";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
