{

  inputs.packument.url   = "https://registry.npmjs.org/utif?rev=14-1004a6645c45bc640614bd84a177c34a";
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
    ident = "utif";
    ldir  = "info/unscoped/u/utif";
    inherit packument fetchInfo;
  } // latest';

}
