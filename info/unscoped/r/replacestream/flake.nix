{

  inputs.packument.url   = "https://registry.npmjs.org/replacestream?rev=55-93d1fee02e95ba264daee0b888c20e01";
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
    ident = "replacestream";
    ldir  = "info/unscoped/r/replacestream";
    inherit packument fetchInfo;
  } // latest';

}
