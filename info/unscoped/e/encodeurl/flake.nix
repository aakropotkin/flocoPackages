{

  inputs.packument.url   = "https://registry.npmjs.org/encodeurl?rev=9-d9086cd80efefbda548ba21d8e6d2eb3";
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
    ident = "encodeurl";
    ldir  = "info/unscoped/e/encodeurl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
