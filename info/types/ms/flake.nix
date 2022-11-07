{

  inputs.packument.url   = "https://registry.npmjs.org/@types/ms?rev=523-a78df02b0c86399a9bf789e408c8e8fb";
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
    ident = "@types/ms";
    ldir  = "info/types/ms";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
