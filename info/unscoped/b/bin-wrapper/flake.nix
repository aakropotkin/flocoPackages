{

  inputs.packument.url   = "https://registry.npmjs.org/bin-wrapper?rev=133-d1e999a1904157aefd16534cd66dff76";
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
    ident = "bin-wrapper";
    ldir  = "info/unscoped/b/bin-wrapper";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
