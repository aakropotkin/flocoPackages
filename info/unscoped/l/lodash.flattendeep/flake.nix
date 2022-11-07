{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.flattendeep?rev=21-a2e5f3c4e2c2d66ce918941136099711";
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
    ident = "lodash.flattendeep";
    ldir  = "info/unscoped/l/lodash.flattendeep";
    inherit packument fetchInfo;
  } // latest';

}
