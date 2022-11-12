{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/colorette?_rev=38-0793ca60c79d6f7d26da9991cbc4009f";
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
    ident = "colorette";
    ldir  = "info/unscoped/c/colorette";
    inherit packument fetchInfo;
  } // latest';

}
