{

  inputs.packument.url   = "https://registry.npmjs.org/pumpify?rev=48-54e20180f2bd6cac500d0418d7a4725e";
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
    ident = "pumpify";
    ldir  = "info/unscoped/p/pumpify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
