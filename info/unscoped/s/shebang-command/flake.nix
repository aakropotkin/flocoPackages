{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/shebang-command?_rev=8-46b634b675dd50c5f592c8c091e2887c";
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
    ident = "shebang-command";
    ldir  = "info/unscoped/s/shebang-command";
    inherit packument fetchInfo;
  } // latest';

}
