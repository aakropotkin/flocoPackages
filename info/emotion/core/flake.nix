{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@emotion%2fcore?_rev=91-ee0a3c2b04049ddb5b511bfe083461cd";
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
    scope = "@emotion";
    ident = "@emotion/core";
    ldir  = "info/emotion/core";
    inherit packument fetchInfo;
  } // latest';

}
