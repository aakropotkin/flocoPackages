{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-block-scoping?rev=102-60b709face7758f11bfc0242b8cd52fd";
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
    scope = "@babel";
    ident = "@babel/plugin-transform-block-scoping";
    ldir  = "info/babel/plugin-transform-block-scoping";
    inherit packument fetchInfo;
  } // latest';

}
