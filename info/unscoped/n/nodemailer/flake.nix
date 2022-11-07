{

  inputs.packument.url   = "https://registry.npmjs.org/nodemailer?rev=990-09ce35c46de9e6f6d7c42bfdd93478b9";
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
    scope = null;
    ident = "nodemailer";
    ldir  = "info/unscoped/n/nodemailer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
