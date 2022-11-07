{

  inputs.packument.url   = "https://registry.npmjs.org/broccoli-persistent-filter?rev=69-982b5443224cc647be5212bfa36b5cb0";
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
    ident = "broccoli-persistent-filter";
    ldir  = "info/unscoped/b/broccoli-persistent-filter";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
