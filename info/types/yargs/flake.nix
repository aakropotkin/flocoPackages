{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fyargs?_rev=996-ea208d4cfa373cf9c03c4823ab0d1050";
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
    scope = "@types";
    ident = "@types/yargs";
    ldir  = "info/types/yargs";
    inherit packument fetchInfo;
  } // latest';

}
