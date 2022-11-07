{

  inputs.packument.url   = "https://registry.npmjs.org/servify?rev=15-9bb58a1da0c3684c7441e0f4701d6223";
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
    ident = "servify";
    ldir  = "info/unscoped/s/servify";
    inherit packument fetchInfo;
  } // latest';

}
