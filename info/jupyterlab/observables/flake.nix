{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jupyterlab/observables?_rev=364-9cfc498ea0b632086992d51d745d2cb9";
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
    ident = "@jupyterlab/observables";
    ldir  = "info/jupyterlab/observables";
    inherit packument fetchInfo;
  } // latest';

}
