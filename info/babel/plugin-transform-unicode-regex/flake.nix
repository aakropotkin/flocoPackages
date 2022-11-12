{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/plugin-transform-unicode-regex?_rev=81-1c71354af000985398e2880e0b34c2aa";
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
    ident = "@babel/plugin-transform-unicode-regex";
    ldir  = "info/babel/plugin-transform-unicode-regex";
    inherit packument fetchInfo;
  } // latest';

}
