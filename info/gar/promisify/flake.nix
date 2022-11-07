{

  inputs.packument.url   = "https://registry.npmjs.org/@gar/promisify?rev=7-0e4b7b88a2c3d1c15b916d087a97501f";
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
    scope = "@gar";
    ident = "@gar/promisify";
    ldir  = "info/gar/promisify";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
