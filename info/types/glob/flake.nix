{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/glob?_rev=644-ce32066715afbd57fdc3140e84ef8d36";
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
    ident = "@types/glob";
    ldir  = "info/types/glob";
    inherit packument fetchInfo;
  } // latest';

}
