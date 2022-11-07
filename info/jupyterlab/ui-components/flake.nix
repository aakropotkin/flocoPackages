{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/ui-components?rev=335-a28e4b3a9851532a314803b6f8780c05";
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
    ident = "@jupyterlab/ui-components";
    ldir  = "info/jupyterlab/ui-components";
    inherit packument fetchInfo;
  } // latest';

}
