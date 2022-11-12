{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/renderkid?_rev=46-2d16a7a4e61c84c99193f68349bca3ed";
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
    ident = "renderkid";
    ldir  = "info/unscoped/r/renderkid";
    inherit packument fetchInfo;
  } // latest';

}
