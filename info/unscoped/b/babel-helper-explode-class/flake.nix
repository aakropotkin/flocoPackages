{

  inputs.packument.url   = "https://registry.npmjs.org/babel-helper-explode-class?rev=87-f341f9c9d36a9d0f00859629ed4cadea";
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
    ident = "babel-helper-explode-class";
    ldir  = "info/unscoped/b/babel-helper-explode-class";
    inherit packument fetchInfo;
  } // latest';

}
