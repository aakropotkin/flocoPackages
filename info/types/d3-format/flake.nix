{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-format?rev=634-ea032646adf918a0398514e420c883f7";
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
    ident = "@types/d3-format";
    ldir  = "info/types/d3-format";
    inherit packument fetchInfo;
  } // latest';

}
