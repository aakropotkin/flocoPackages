{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/domhandler?_rev=61-b8cb4552d96155b76526701da5cf350d";
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
    ident = "domhandler";
    ldir  = "info/unscoped/d/domhandler";
    inherit packument fetchInfo;
  } // latest';

}
