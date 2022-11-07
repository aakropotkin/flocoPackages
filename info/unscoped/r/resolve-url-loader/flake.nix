{

  inputs.packument.url   = "https://registry.npmjs.org/resolve-url-loader?rev=102-68b8e4ef6cc318a12512fd43be6b29e2";
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
    ident = "resolve-url-loader";
    ldir  = "info/unscoped/r/resolve-url-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
