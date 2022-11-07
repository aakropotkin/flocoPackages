{

  inputs.packument.url   = "https://registry.npmjs.org/@types/serve-index?rev=461-e0f8964bb5ea5dc3dabdba78941f199e";
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
    ident = "@types/serve-index";
    ldir  = "info/types/serve-index";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
