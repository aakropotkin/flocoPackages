{

  inputs.packument.url   = "https://registry.npmjs.org/@jupyterlab/docprovider?rev=148-2e59bc9811cf87bc8e5157a873733fe4";
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
    ident = "@jupyterlab/docprovider";
    ldir  = "info/jupyterlab/docprovider";
    inherit packument fetchInfo;
  } // latest';

}
