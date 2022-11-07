{

  inputs.packument.url   = "https://registry.npmjs.org/luxon?rev=150-77002f0ac946ee914ce35a9c53192861";
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
    ident = "luxon";
    ldir  = "info/unscoped/l/luxon";
    inherit packument fetchInfo;
  } // latest';

}
