{

  inputs.packument.url   = "https://registry.npmjs.org/@ethereumjs/common?rev=48-608545a864f57a3e037ad9254bb48e29";
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
    ident = "@ethereumjs/common";
    ldir  = "info/ethereumjs/common";
    inherit packument fetchInfo;
  } // latest';

}
