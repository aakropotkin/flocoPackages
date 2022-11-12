{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-react-jsx-development?_rev=19-2b0b698eb3afc673b2fc08ffcceef51d";
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
    ident = "@babel/plugin-transform-react-jsx-development";
    ldir  = "info/babel/plugin-transform-react-jsx-development";
    inherit packument fetchInfo;
  } // latest';

}
