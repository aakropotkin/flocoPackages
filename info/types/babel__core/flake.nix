{

  inputs.packument.url   = "https://registry.npmjs.org/@types/babel__core?rev=511-af8f3f79b7d5c2a30d1684e7f515a688";
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
    ident = "@types/babel__core";
    ldir  = "info/types/babel__core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
