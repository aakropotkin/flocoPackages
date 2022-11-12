{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/express?_rev=743-1c0d768041b5bfbc2f5abd70034ef71a";
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
    ident = "@types/express";
    ldir  = "info/types/express";
    inherit packument fetchInfo;
  } // latest';

}
