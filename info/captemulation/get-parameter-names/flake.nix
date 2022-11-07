{

  inputs.packument.url   = "https://registry.npmjs.org/@captemulation/get-parameter-names?rev=11-5b0993c27dee8e4d3411180e117d1669";
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
