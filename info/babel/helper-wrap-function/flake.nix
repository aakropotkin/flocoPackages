{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/helper-wrap-function?_rev=90-3e1bedbd1d4cd2986d563b3ea8ca56dc";
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
    ident = "@babel/helper-wrap-function";
    ldir  = "info/babel/helper-wrap-function";
    inherit packument fetchInfo;
  } // latest';

}
