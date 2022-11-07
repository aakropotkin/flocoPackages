{

  inputs.packument.url   = "https://registry.npmjs.org/lodash-es?rev=108-33f265f31ff2175852fec42d4a0851b7";
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
    ident = "lodash-es";
    ldir  = "info/unscoped/l/lodash-es";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
