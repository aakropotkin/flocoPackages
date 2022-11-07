{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/preset-modules?rev=13-8f8adc23d4b8360bd4144bc533c97d3e";
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
    ident = "@babel/preset-modules";
    ldir  = "info/babel/preset-modules";
    inherit packument fetchInfo;
  } // latest';

}
