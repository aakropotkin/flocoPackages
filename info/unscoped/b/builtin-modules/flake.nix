{

  inputs.packument.url   = "https://registry.npmjs.org/builtin-modules?rev=13-032f093525529fbace93ef294b5f79fa";
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
    ident = "builtin-modules";
    ldir  = "info/unscoped/b/builtin-modules";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
