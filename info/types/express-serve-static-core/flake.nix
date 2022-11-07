{

  inputs.packument.url   = "https://registry.npmjs.org/@types/express-serve-static-core?rev=1191-584bf2bc3611613f8d4ebf815676e79e";
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
    ident = "@types/express-serve-static-core";
    ldir  = "info/types/express-serve-static-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
