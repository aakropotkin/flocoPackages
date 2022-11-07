{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-for-of?rev=90-b79f5355355f0bebab288125641db401";
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
    ident = "@babel/plugin-transform-for-of";
    ldir  = "info/babel/plugin-transform-for-of";
    inherit packument fetchInfo;
  } // latest';

}
