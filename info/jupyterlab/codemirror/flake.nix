{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/codemirror?rev=439-fba112f7e4f9e801ef29a4433d7c0e38";
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
    ident = "@jupyterlab/codemirror";
    ldir  = "info/jupyterlab/codemirror";
    inherit packument fetchInfo;
  } // latest';

}
