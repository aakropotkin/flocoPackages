{

  inputs.packument.url   = "https://registry.npmjs.org/function-bind?rev=19-f9e851d54b1bc584b06b6fcd450e232e";
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
    ident = "function-bind";
    ldir  = "info/unscoped/f/function-bind";
    inherit packument fetchInfo;
  } // latest';

}
