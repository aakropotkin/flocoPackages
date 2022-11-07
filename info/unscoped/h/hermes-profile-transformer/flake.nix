{

  inputs.packument.url   = "https://registry.npmjs.org/hermes-profile-transformer?rev=9-a2abbabb5ead5725ed29a05b32388562";
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
    ident = "hermes-profile-transformer";
    ldir  = "info/unscoped/h/hermes-profile-transformer";
    inherit packument fetchInfo;
  } // latest';

}
