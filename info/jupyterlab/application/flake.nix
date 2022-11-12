{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jupyterlab/application?_rev=453-20fb87e385b2f8fbe5c435381af32365";
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
    ident = "@jupyterlab/application";
    ldir  = "info/jupyterlab/application";
    inherit packument fetchInfo;
  } // latest';

}
