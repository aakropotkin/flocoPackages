{

  inputs.packument.url   = "https://registry.npmjs.org/@types/prettier?rev=927-6c796ad445096e9646b368225f1c2fa3";
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
    ident = "@types/prettier";
    ldir  = "info/types/prettier";
    inherit packument fetchInfo;
  } // latest';

}
