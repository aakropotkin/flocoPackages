{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/plugin-syntax-logical-assignment-operators?rev=46-a8e7e94f3fafd99130937099a193e911";
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
    ident = "@babel/plugin-syntax-logical-assignment-operators";
    ldir  = "info/babel/plugin-syntax-logical-assignment-operators";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
