{

  inputs.packument.url   = "https://registry.npmjs.org/optipng-bin?rev=322-845c482f6ff42c4adf80eb849f26975f";
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
    ident = "optipng-bin";
    ldir  = "info/unscoped/o/optipng-bin";
    inherit packument fetchInfo;
  } // latest';

}
