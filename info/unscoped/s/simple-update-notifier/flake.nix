{

  inputs.packument.url   = "https://registry.npmjs.org/simple-update-notifier?rev=7-e7449b5502dceeaca07164f0b117388f";
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
    ident = "simple-update-notifier";
    ldir  = "info/unscoped/s/simple-update-notifier";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
