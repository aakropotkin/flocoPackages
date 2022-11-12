{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/double-ended-queue?_rev=523-c9f5c5191359166631f9ae7a3fcbe519";
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
    ident = "@types/double-ended-queue";
    ldir  = "info/types/double-ended-queue";
    inherit packument fetchInfo;
  } // latest';

}
