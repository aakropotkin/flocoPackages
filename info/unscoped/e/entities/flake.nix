{

  inputs.packument.url   = "https://registry.npmjs.org/entities?rev=72-6c719e1fd27b0d774614d41b0ee3a608";
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
    ident = "entities";
    ldir  = "info/unscoped/e/entities";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
