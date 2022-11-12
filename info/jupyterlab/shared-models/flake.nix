{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jupyterlab%2fshared-models?_rev=147-385b4d0c6fa54a969f875e8dc5998451";
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
    ident = "@jupyterlab/shared-models";
    ldir  = "info/jupyterlab/shared-models";
    inherit packument fetchInfo;
  } // latest';

}
