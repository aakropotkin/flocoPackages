{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@discordjs/builders?_rev=572-4639f8e0a145fc8956083cff4bbd85e4";
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
    ident = "@discordjs/builders";
    ldir  = "info/discordjs/builders";
    inherit packument fetchInfo;
  } // latest';

}
