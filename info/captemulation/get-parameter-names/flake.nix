{

  inputs.packument.url   = "https://registry.npmjs.org/@captemulation/get-parameter-names";
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
    scope = "@captemulation";
    ident = "@captemulation/get-parameter-names";
    ldir  = "info/captemulation/get-parameter-names";
    inherit packument fetchInfo;
  } // latest';

}
