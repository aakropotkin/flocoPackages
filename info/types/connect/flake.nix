{

  inputs.packument.url   = "https://registry.npmjs.org/@types/connect?rev=595-5b4900174f436a5a4d6c97f0626c29d8";
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
    ident = "@types/connect";
    ldir  = "info/types/connect";
    inherit packument fetchInfo;
  } // latest';

}
