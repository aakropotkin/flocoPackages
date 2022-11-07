{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/services?rev=451-c9dc1c6e1411e225b6ea63c55d042a93";
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
    scope = "@jupyterlab";
    ident = "@jupyterlab/services";
    ldir  = "info/jupyterlab/services";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
