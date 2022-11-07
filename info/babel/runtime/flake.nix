{

  inputs.packument.url   = "https://registry.npmjs.org/@babel/runtime?rev=151-44980ec376ca08c9163f2dbdb52657e0";
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
    ident = "@babel/runtime";
    ldir  = "info/babel/runtime";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
