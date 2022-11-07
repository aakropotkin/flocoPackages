{

  inputs.packument.url   = "https://registry.npmjs.org/yargs?rev=973-5a22d30ef089e7c12c7a65f92b950b7d";
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
    ident = "yargs";
    ldir  = "info/unscoped/y/yargs";
    inherit packument fetchInfo;
  } // latest';

}
