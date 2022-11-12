{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2ffs-extra?_rev=844-bc68a03fac66f57227cb4ee1715630b9";
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
    ident = "@types/fs-extra";
    ldir  = "info/types/fs-extra";
    inherit packument fetchInfo;
  } // latest';

}
