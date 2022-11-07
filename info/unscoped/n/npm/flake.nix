{

  inputs.packument.url   = "https://registry.npmjs.org/npm?rev=2734-cd77b4cb5dbb9717611d68867e207ac8";
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
    ident = "npm";
    ldir  = "info/unscoped/n/npm";
    inherit packument fetchInfo;
  } // latest';

}
