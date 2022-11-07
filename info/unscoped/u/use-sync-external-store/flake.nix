{

  inputs.packument.url   = "https://registry.npmjs.org/use-sync-external-store?rev=534-21eeaf1543613acf0d566465bcda2ef2";
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
    ident = "use-sync-external-store";
    ldir  = "info/unscoped/u/use-sync-external-store";
    inherit packument fetchInfo;
  } // latest';

}
