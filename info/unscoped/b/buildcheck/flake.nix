{

  inputs.packument.url   = "https://registry.npmjs.org/buildcheck?rev=5-7b0ee241b8f09893b108dbdd2f2002e1";
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
    ident = "buildcheck";
    ldir  = "info/unscoped/b/buildcheck";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
