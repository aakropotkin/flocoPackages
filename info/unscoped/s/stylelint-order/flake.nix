{

  inputs.packument.url   = "https://registry.npmjs.org/stylelint-order?rev=32-21230b400f40b53e2ab184d235d21210";
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
    ident = "stylelint-order";
    ldir  = "info/unscoped/s/stylelint-order";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
