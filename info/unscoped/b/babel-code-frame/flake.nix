{

  inputs.packument.url   = "https://registry.npmjs.org/babel-code-frame?rev=115-93f92e19f9a6ac9442566fbdf95945ad";
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
    ident = "babel-code-frame";
    ldir  = "info/unscoped/b/babel-code-frame";
    inherit packument fetchInfo;
  } // latest';

}
