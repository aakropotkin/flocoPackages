{

  inputs.packument.url   = "https://registry.npmjs.org/finalhandler?rev=79-c6925c5b4cf605522d7a82a4de864dca";
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
    ident = "finalhandler";
    ldir  = "info/unscoped/f/finalhandler";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
