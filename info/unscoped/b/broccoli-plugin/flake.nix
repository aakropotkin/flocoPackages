{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-plugin?rev=28-8c95276d493e7b94aa544a041ac960e3";
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
    ident = "broccoli-plugin";
    ldir  = "info/unscoped/b/broccoli-plugin";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
