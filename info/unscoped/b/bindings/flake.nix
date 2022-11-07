{

  inputs.packument.url   = "https://registry.npmjs.org/bindings?rev=68-60220a82747dbff57dd2b73a4672e64d";
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
    ident = "bindings";
    ldir  = "info/unscoped/b/bindings";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
