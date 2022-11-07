{

  inputs.packument.url   = "https://registry.npmjs.org/@redis/graph?rev=1-b1c7d86beedbfa17c041a69926917b08";
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
    scope = "@redis";
    ident = "@redis/graph";
    ldir  = "info/redis/graph";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
