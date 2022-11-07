{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-flow?rev=80-d4109888ea2659cc5a73f12b0b53bfd3";
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
    ident = "@babel/plugin-syntax-flow";
    ldir  = "info/babel/plugin-syntax-flow";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
