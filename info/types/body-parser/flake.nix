{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fbody-parser?_rev=635-178b9f7851adba9a5ee1159e341f6c3a";
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
    ident = "@types/body-parser";
    ldir  = "info/types/body-parser";
    inherit packument fetchInfo;
  } // latest';

}
