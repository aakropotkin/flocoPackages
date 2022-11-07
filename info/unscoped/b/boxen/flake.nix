{

  inputs.packument.url   = "https://registry.npmjs.org/boxen?rev=51-9c509c661b1d06fe82feb28d89823f08";
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
    ident = "boxen";
    ldir  = "info/unscoped/b/boxen";
    inherit packument fetchInfo;
  } // latest';

}
