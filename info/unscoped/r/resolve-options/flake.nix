{

  inputs.packument.url   = "https://registry.npmjs.org/resolve-options?rev=8-868dff1d6460a0fadb95add5250c5d8b";
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
    ident = "resolve-options";
    ldir  = "info/unscoped/r/resolve-options";
    inherit packument fetchInfo;
  } // latest';

}
