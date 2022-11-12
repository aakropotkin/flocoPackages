{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-unicode-escapes?_rev=13-b22709b5735be84c0f2de398b46f52ad";
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
    ident = "@babel/plugin-transform-unicode-escapes";
    ldir  = "info/babel/plugin-transform-unicode-escapes";
    inherit packument fetchInfo;
  } // latest';

}
