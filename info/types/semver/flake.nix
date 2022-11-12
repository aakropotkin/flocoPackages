{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fsemver?_rev=762-d91e19b9c0d5c43e0343abb20903dd87";
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
    ident = "@types/semver";
    ldir  = "info/types/semver";
    inherit packument fetchInfo;
  } // latest';

}
