{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/settingregistry?rev=279-a42ea6eda8d3044e923b3622c5c846d8";
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
    ident = "@jupyterlab/settingregistry";
    ldir  = "info/jupyterlab/settingregistry";
    inherit packument fetchInfo;
  } // latest';

}
