{

  inputs.packument.url   = "https://registry.npmjs.org/@discordjs/rest?rev=570-3303cdb7c747f8447dd9d8bd76724161";
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
    ident = "@discordjs/rest";
    ldir  = "info/discordjs/rest";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
