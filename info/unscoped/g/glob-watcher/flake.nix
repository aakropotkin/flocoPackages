{

  inputs.packument.url   = "https://registry.npmjs.org/glob-watcher?rev=45-e8b6f18ed0d16c3841b57ee4f555170f";
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
    ident = "glob-watcher";
    ldir  = "info/unscoped/g/glob-watcher";
    inherit packument fetchInfo;
  } // latest';

}
