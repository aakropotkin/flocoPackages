{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.isarguments?rev=44-76454a0f5f01d6ad1068fac4060ca972";
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
    ident = "lodash.isarguments";
    ldir  = "info/unscoped/l/lodash.isarguments";
    inherit packument fetchInfo;
  } // latest';

}
