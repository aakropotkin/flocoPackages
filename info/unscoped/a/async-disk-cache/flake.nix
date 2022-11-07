{

  inputs.packument.url   = "https://registry.npmjs.org/async-disk-cache?rev=30-7bb443eae2fc16f8b065a75d8f42cd45";
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
    ident = "async-disk-cache";
    ldir  = "info/unscoped/a/async-disk-cache";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
