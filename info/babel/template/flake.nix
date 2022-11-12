{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@babel/template?_rev=89-fc17c68232cff974378f248b87377b45";
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
    ident = "@babel/template";
    ldir  = "info/babel/template";
    inherit packument fetchInfo;
  } // latest';

}
