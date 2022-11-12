{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/babel__template?_rev=373-d15c19389aba17d12c9f6704b7f7e10b";
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
    ident = "@types/babel__template";
    ldir  = "info/types/babel__template";
    inherit packument fetchInfo;
  } // latest';

}
