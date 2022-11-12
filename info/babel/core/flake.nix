{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/core?_rev=182-cba662d90bc52317fdc15bb31835e9eb";
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
    ident = "@babel/core";
    ldir  = "info/babel/core";
    inherit packument fetchInfo;
  } // latest';

}
