{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/d3-ease?_rev=600-470b25897ef9e1efa0cb233352c54d31";
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
    ident = "@types/d3-ease";
    ldir  = "info/types/d3-ease";
    inherit packument fetchInfo;
  } // latest';

}
