{

  inputs.packument.url   = "https://registry.npmjs.org/on-exit-leak-free";
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
    ident = "on-exit-leak-free";
    ldir  = "info/unscoped/o/on-exit-leak-free";
    inherit packument fetchInfo;
  } // latest';

}
