{

  inputs.packument.url   = "https://registry.npmjs.org/@ethereumjs/util";
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
    scope = "@ethereumjs";
    ident = "@ethereumjs/util";
    ldir  = "info/ethereumjs/util";
    inherit packument fetchInfo;
  } // latest';

}
