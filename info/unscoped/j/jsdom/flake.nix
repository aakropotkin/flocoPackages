{

  inputs.packument.url   = "https://registry.npmjs.org/jsdom?rev=651-25b31a8320750fd391fcf5e58fb76d67";
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
    ident = "jsdom";
    ldir  = "info/unscoped/j/jsdom";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
