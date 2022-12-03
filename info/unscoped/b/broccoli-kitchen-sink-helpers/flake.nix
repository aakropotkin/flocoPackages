{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-kitchen-sink-helpers";
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
    ident = "broccoli-kitchen-sink-helpers";
    ldir  = "info/unscoped/b/broccoli-kitchen-sink-helpers";
    inherit packument fetchInfo;
  } // latest';

}
