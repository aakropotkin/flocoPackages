{

  inputs.packument.url   = "https://registry.npmjs.org/ts-node?rev=192-812207273d99d4fff1bdb86f64c42f1f";
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
    ident = "ts-node";
    ldir  = "info/unscoped/t/ts-node";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
