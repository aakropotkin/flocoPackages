{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-bindify-decorators?rev=88-5ac5575227025f189efbf38074afe921";
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
    ident = "babel-helper-bindify-decorators";
    ldir  = "info/unscoped/b/babel-helper-bindify-decorators";
    inherit packument fetchInfo;
  } // latest';

}
