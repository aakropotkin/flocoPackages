{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-get-function-arity?rev=87-a085e7b5f12c5822b07474e36c3f3763";
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
    ident = "babel-helper-get-function-arity";
    ldir  = "info/unscoped/b/babel-helper-get-function-arity";
    inherit packument fetchInfo;
  } // latest';

}
