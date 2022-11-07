{

  inputs.packument.url   = "https://registry.npmjs.org/help-me?rev=18-683102e3575c7b9c10aa9307f1f05fda";
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
    ident = "help-me";
    ldir  = "info/unscoped/h/help-me";
    inherit packument fetchInfo;
  } // latest';

}
