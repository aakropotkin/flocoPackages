{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-fetch?_rev=608-66af370b415685b08f8a6ad4b8eff46a";
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
    ident = "@types/d3-fetch";
    ldir  = "info/types/d3-fetch";
    inherit packument fetchInfo;
  } // latest';

}
