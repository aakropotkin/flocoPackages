{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jupyterlab/rendermime-interfaces?_rev=384-c1cfad731f5dc7cabe950b22db546b2d";
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
    ident = "@jupyterlab/rendermime-interfaces";
    ldir  = "info/jupyterlab/rendermime-interfaces";
    inherit packument fetchInfo;
  } // latest';

}
