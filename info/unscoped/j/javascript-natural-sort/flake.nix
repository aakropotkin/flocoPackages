{

  inputs.packument.url   = "https://registry.npmjs.org/javascript-natural-sort";
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
    ident = "javascript-natural-sort";
    ldir  = "info/unscoped/j/javascript-natural-sort";
    inherit packument fetchInfo;
  } // latest';

}
