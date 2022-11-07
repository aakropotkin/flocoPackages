{

  inputs.packument.url   = "https://registry.npmjs.org/memory-cache?rev=94-8a32058a5240dafc3996ee719ac25e79";
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
    ident = "memory-cache";
    ldir  = "info/unscoped/m/memory-cache";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
