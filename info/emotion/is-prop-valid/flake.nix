{

  inputs.packument.url   = "https://registry.npmjs.org/@emotion/is-prop-valid?rev=41-00a9881d5c5fb314a248fae18621e842";
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
    scope = "@emotion";
    ident = "@emotion/is-prop-valid";
    ldir  = "info/emotion/is-prop-valid";
    inherit packument fetchInfo;
  } // latest';

}
