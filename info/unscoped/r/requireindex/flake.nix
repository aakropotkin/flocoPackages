{

  inputs.packument.url   = "https://registry.npmjs.org/requireindex?rev=64-4f35f20be9d65abc81ff452e9506879a";
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
    ident = "requireindex";
    ldir  = "info/unscoped/r/requireindex";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
