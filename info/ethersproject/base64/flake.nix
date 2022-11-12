{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@ethersproject%2fbase64?_rev=38-90914f745a888acf5c4f6f52c26348a0";
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
    scope = "@ethersproject";
    ident = "@ethersproject/base64";
    ldir  = "info/ethersproject/base64";
    inherit packument fetchInfo;
  } // latest';

}
