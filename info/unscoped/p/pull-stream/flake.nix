{

  inputs.packument.url   = "https://registry.npmjs.org/pull-stream?rev=159-e13c6d3d15352ab9ab5e6474f89cbe05";
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
    ident = "pull-stream";
    ldir  = "info/unscoped/p/pull-stream";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
