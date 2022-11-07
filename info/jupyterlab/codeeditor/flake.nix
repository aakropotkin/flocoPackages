{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/codeeditor?rev=420-9e7e203dd865469c7bc6a9210e73492f";
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
    ident = "@jupyterlab/codeeditor";
    ldir  = "info/jupyterlab/codeeditor";
    inherit packument fetchInfo;
  } // latest';

}
