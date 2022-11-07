{

  inputs.packument.url   = "https://registry.npmjs.org/shallow-equal?rev=9-84739111a4318ed9db1a98a7925846f6";
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
    ident = "shallow-equal";
    ldir  = "info/unscoped/s/shallow-equal";
    inherit packument fetchInfo;
  } // latest';

}
