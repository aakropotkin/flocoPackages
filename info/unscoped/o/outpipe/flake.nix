{

  inputs.packument.url   = "https://registry.npmjs.org/outpipe?rev=12-74f2a5d2d2cfd23518740c994692c138";
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
    ident = "outpipe";
    ldir  = "info/unscoped/o/outpipe";
    inherit packument fetchInfo;
  } // latest';

}
