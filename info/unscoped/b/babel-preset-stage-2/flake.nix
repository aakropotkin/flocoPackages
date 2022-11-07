{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-stage-2?rev=91-bdaacffd81827b07edb4e5e60ce7fa1f";
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
    ident = "babel-preset-stage-2";
    ldir  = "info/unscoped/b/babel-preset-stage-2";
    inherit packument fetchInfo;
  } // latest';

}
