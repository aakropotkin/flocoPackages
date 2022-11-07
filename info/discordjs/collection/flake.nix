{

  inputs.packument.url   = "https://registry.npmjs.org/@discordjs/collection?rev=576-2f3900be8b7199203608ddf361999c00";
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
    ident = "@discordjs/collection";
    ldir  = "info/discordjs/collection";
    inherit packument fetchInfo;
  } // latest';

}
