{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/statedb?rev=279-26f7b135173f65f0aa3dec707e318456";
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
    ident = "@jupyterlab/statedb";
    ldir  = "info/jupyterlab/statedb";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
