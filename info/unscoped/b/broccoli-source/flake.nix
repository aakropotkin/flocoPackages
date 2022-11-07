{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-source?rev=14-8b156a9e0219fb0c3dcafad40e00e84a";
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
    ident = "broccoli-source";
    ldir  = "info/unscoped/b/broccoli-source";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
