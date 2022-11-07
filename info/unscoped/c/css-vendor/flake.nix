{

  inputs.packument.url   = "https://registry.npmjs.org/css-vendor?rev=42-98228c7889e778c9205c047a2bb5e520";
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
    ident = "css-vendor";
    ldir  = "info/unscoped/c/css-vendor";
    inherit packument fetchInfo;
  } // latest';

}
