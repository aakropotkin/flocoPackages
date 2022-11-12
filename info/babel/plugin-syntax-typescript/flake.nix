{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel%2fplugin-syntax-typescript?_rev=83-786f7a05bc00e81ecf8644dd7d4db7ea";
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
    ident = "@babel/plugin-syntax-typescript";
    ldir  = "info/babel/plugin-syntax-typescript";
    inherit packument fetchInfo;
  } // latest';

}
