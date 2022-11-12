{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fasync?_rev=967-82086377260822ab21c4af99ef328ce8";
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
    ident = "@types/async";
    ldir  = "info/types/async";
    inherit packument fetchInfo;
  } // latest';

}
