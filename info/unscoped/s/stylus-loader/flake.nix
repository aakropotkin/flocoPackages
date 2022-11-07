{

  inputs.packument.url   = "https://registry.npmjs.org/stylus-loader?rev=84-7ada9d9dc1e3bcdb443ea31bec801edf";
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
    ident = "stylus-loader";
    ldir  = "info/unscoped/s/stylus-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
