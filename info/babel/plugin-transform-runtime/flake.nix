{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-runtime?rev=130-80e2bc65bf82c1a3ff27018392a6177f";
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
    ident = "@babel/plugin-transform-runtime";
    ldir  = "info/babel/plugin-transform-runtime";
    inherit packument fetchInfo;
  } // latest';

}
