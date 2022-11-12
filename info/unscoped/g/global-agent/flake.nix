{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/global-agent?_rev=46-87c137c0b157c713b809a666f7dbc83c";
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
    ident = "global-agent";
    ldir  = "info/unscoped/g/global-agent";
    inherit packument fetchInfo;
  } // latest';

}
