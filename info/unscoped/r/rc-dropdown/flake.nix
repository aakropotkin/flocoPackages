{

  inputs.packument.url   = "https://registry.npmjs.org/rc-dropdown?rev=77-8e84e9e2af05da5eb65e38771cef8509";
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
    ident = "rc-dropdown";
    ldir  = "info/unscoped/r/rc-dropdown";
    inherit packument fetchInfo;
  } // latest';

}
