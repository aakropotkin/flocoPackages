{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/rendermime?rev=444-5d4089334af360ca5d85831ae9dadbe0";
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
    ident = "@jupyterlab/rendermime";
    ldir  = "info/jupyterlab/rendermime";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
