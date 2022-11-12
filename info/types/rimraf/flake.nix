{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/rimraf?_rev=529-c4388f43121d7acb6c5df92285fb62da";
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
    ident = "@types/rimraf";
    ldir  = "info/types/rimraf";
    inherit packument fetchInfo;
  } // latest';

}
