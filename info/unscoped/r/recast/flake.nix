{

  inputs.packument.url   = "https://registry.npmjs.org/recast?rev=409-326822d14ec597dc62df3ebbd9d57901";
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
    ident = "recast";
    ldir  = "info/unscoped/r/recast";
    inherit packument fetchInfo;
  } // latest';

}
