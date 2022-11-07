{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-optimise-call-expression?rev=79-1a0820319c33c38b442b877d1ea56e60";
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
    ident = "babel-helper-optimise-call-expression";
    ldir  = "info/unscoped/b/babel-helper-optimise-call-expression";
    inherit packument fetchInfo;
  } // latest';

}
