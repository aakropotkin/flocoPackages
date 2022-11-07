{

  inputs.packument.url   = "https://registry.npmjs.org/@types/babel__traverse?rev=524-030639d1fd25e5e8c531c687645f384d";
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
    scope = "@types";
    ident = "@types/babel__traverse";
    ldir  = "info/types/babel__traverse";
    inherit packument fetchInfo;
  } // latest';

}
