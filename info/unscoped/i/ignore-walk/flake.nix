{

  inputs.packument.url   = "https://registry.npmjs.org/ignore-walk?rev=24-e8ddd27b19399208045ba20b8bc7c11f";
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
    ident = "ignore-walk";
    ldir  = "info/unscoped/i/ignore-walk";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
