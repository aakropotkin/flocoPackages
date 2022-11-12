{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/jsbn?_rev=17-5ec312e4eb830ea8b59e5b97b8f9aa5d";
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
    ident = "jsbn";
    ldir  = "info/unscoped/j/jsbn";
    inherit packument fetchInfo;
  } // latest';

}
