{

  inputs.packument.url   = "https://registry.npmjs.org/picomatch?rev=27-00b9521d2c410244d792c279189c4814";
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
    scope = null;
    ident = "picomatch";
    ldir  = "info/unscoped/p/picomatch";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
