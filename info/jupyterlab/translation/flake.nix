{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/translation?rev=216-45df498718190efff16e700c169d6030";
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
    ident = "@jupyterlab/translation";
    ldir  = "info/jupyterlab/translation";
    inherit packument fetchInfo;
  } // latest';

}
