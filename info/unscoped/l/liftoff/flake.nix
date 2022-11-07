{

  inputs.packument.url   = "https://registry.npmjs.org/liftoff?rev=195-4a6549374df4ce3e776cacda1570e73d";
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
    ident = "liftoff";
    ldir  = "info/unscoped/l/liftoff";
    inherit packument fetchInfo;
  } // latest';

}
