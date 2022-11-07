{

  inputs.packument.url   = "https://registry.npmjs.org/for-each?rev=18-fcc43466309c03345c4f65a9db56c96e";
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
    ident = "for-each";
    ldir  = "info/unscoped/f/for-each";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
