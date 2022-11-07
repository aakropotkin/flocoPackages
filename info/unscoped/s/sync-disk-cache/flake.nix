{

  inputs.packument.url   = "https://registry.npmjs.org/sync-disk-cache?rev=21-cca54b618512f8fb7afe326a2411b67b";
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
    ident = "sync-disk-cache";
    ldir  = "info/unscoped/s/sync-disk-cache";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
