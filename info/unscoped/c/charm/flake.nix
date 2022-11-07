{

  inputs.packument.url   = "https://registry.npmjs.org/charm?rev=64-a72028752c58660033a428d90b80acd2";
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
    ident = "charm";
    ldir  = "info/unscoped/c/charm";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
