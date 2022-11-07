{

  inputs.packument.url   = "https://registry.npmjs.org/@discordjs/util?rev=96-048826bc008695a4b101e8ca8598547c";
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
    scope = "@discordjs";
    ident = "@discordjs/util";
    ldir  = "info/discordjs/util";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
