{

  inputs.packument.url   = "https://registry.npmjs.org/pug-error?rev=18-54c107d692409e4cb5342bf104956c9b";
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
    ident = "pug-error";
    ldir  = "info/unscoped/p/pug-error";
    inherit packument fetchInfo;
  } // latest';

}
