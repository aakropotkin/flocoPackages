{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-transform-destructuring?rev=103-18ee5d9f1aa846c8fb516c2efedd0aab";
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
    ident = "@babel/plugin-transform-destructuring";
    ldir  = "info/babel/plugin-transform-destructuring";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
