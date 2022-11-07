{

  inputs.packument.url   = "https://registry.npmjs.org/create-hash?rev=27-f347fe3eef41a347678b5695a715ed47";
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
    ident = "create-hash";
    ldir  = "info/unscoped/c/create-hash";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
