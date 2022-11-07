{

  inputs.packument.url   = "https://registry.npmjs.org/discord-api-types?rev=1317-d7ca2678c1bc55234090435fc542bf00";
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
    ident = "discord-api-types";
    ldir  = "info/unscoped/d/discord-api-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
