{

  inputs.packument.url   = "https://registry.npmjs.org/async-done?rev=35-44d75c5bf2c1570f44ddf011fcd66b99";
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
    ident = "async-done";
    ldir  = "info/unscoped/a/async-done";
    inherit packument fetchInfo;
  } // latest';

}
