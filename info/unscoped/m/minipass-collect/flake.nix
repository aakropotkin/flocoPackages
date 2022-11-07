{

  inputs.packument.url   = "https://registry.npmjs.org/minipass-collect?rev=3-b8accae65820c44408492e4cf12a54df";
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
    ident = "minipass-collect";
    ldir  = "info/unscoped/m/minipass-collect";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
