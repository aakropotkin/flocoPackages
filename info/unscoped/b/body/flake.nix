{

  inputs.packument.url   = "https://registry.npmjs.org/body?rev=78-e7e4df6c3541f7e44ac2df7d02eb630d";
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
    ident = "body";
    ldir  = "info/unscoped/b/body";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
