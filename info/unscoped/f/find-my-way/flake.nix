{

  inputs.packument.url   = "https://registry.npmjs.org/find-my-way?rev=114-4c866fa481a6926daac3e82c28261958";
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
    ident = "find-my-way";
    ldir  = "info/unscoped/f/find-my-way";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
