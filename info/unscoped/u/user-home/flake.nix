{

  inputs.packument.url   = "https://registry.npmjs.org/user-home?rev=33-ab90c8e3c69055728e479b2d40923065";
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
    ident = "user-home";
    ldir  = "info/unscoped/u/user-home";
    inherit packument fetchInfo;
  } // latest';

}
