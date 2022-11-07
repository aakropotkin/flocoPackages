{

  inputs.packument.url   = "https://registry.npmjs.org/@types/invariant?rev=601-546cba86536367ccdb38f80737a87d39";
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
    ident = "@types/invariant";
    ldir  = "info/types/invariant";
    inherit packument fetchInfo;
  } // latest';

}
