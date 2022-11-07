{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-stage-3?rev=77-a8a0e45b0083b06a61baa0f30dcb3751";
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
    ident = "babel-preset-stage-3";
    ldir  = "info/unscoped/b/babel-preset-stage-3";
    inherit packument fetchInfo;
  } // latest';

}
