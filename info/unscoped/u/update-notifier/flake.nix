{

  inputs.packument.url   = "https://registry.npmjs.org/update-notifier?rev=268-06394d7431b4c1d4b345162ebab58f8a";
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
    ident = "update-notifier";
    ldir  = "info/unscoped/u/update-notifier";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
