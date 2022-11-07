{

  inputs.packument.url   = "https://registry.npmjs.org/msgpackr-extract?rev=42-be0fad7e3aedf109ee3b23d7ea1fbb8d";
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
    ident = "msgpackr-extract";
    ldir  = "info/unscoped/m/msgpackr-extract";
    inherit packument fetchInfo;
  } // latest';

}
