{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jupyterlab%2fstatusbar?_rev=375-01ed0240b50fa0b1045922e3d1269a36";
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
    ident = "@jupyterlab/statusbar";
    ldir  = "info/jupyterlab/statusbar";
    inherit packument fetchInfo;
  } // latest';

}
