{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-factory-title?rev=8-30df5bb6045e4cb60ae7626182a29763";
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
    ident = "micromark-factory-title";
    ldir  = "info/unscoped/m/micromark-factory-title";
    inherit packument fetchInfo;
  } // latest';

}
