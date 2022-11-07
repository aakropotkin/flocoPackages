{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-explode-assignable-expression?rev=86-a2f8c19ba68ac2e391575efa8b0b94ad";
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
    ident = "babel-helper-explode-assignable-expression";
    ldir  = "info/unscoped/b/babel-helper-explode-assignable-expression";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
