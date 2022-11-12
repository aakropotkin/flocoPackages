{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/nodemailer?_rev=726-e151333cbc1e389db8ddc07ea0c4538a";
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
    ident = "@types/nodemailer";
    ldir  = "info/types/nodemailer";
    inherit packument fetchInfo;
  } // latest';

}
