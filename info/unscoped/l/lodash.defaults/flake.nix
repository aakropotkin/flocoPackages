{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.defaults?rev=46-775285f6177f9ed1555255c60059f495";
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
    ident = "lodash.defaults";
    ldir  = "info/unscoped/l/lodash.defaults";
    inherit packument fetchInfo;
  } // latest';

}
