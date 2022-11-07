{

  inputs.packument.url   = "https://registry.npmjs.org/stackframe?rev=35-a6e6f3c9c5ed9eebd3cc9f1879d10a0a";
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
    ident = "stackframe";
    ldir  = "info/unscoped/s/stackframe";
    inherit packument fetchInfo;
  } // latest';

}
