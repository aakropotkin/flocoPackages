{

  inputs.packument.url   = "https://registry.npmjs.org/autoprefixer?rev=657-55d61845983d41346d0864726d4d27df";
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
    ident = "autoprefixer";
    ldir  = "info/unscoped/a/autoprefixer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
