{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@tsconfig%2fnode10?_rev=11-ff004914141e97712b9f6a3b04c94ed6";
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
    scope = "@tsconfig";
    ident = "@tsconfig/node10";
    ldir  = "info/tsconfig/node10";
    inherit packument fetchInfo;
  } // latest';

}
