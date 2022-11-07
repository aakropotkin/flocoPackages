{

  inputs.packument.url   = "https://registry.npmjs.org/@types/serve-static?rev=565-2e63be74c4f67f76a62d41bda64ddf76";
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
    ident = "@types/serve-static";
    ldir  = "info/types/serve-static";
    inherit packument fetchInfo;
  } // latest';

}
