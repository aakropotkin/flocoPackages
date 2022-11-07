{

  inputs.packument.url   = "https://registry.npmjs.org/redent?rev=7-7d1614d0300a5429d8ce9c1e050d3794";
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
    ident = "redent";
    ldir  = "info/unscoped/r/redent";
    inherit packument fetchInfo;
  } // latest';

}
