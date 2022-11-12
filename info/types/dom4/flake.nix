{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fdom4?_rev=562-0b05c5db2311e4dd3d09f8598ceea5ec";
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
    ident = "@types/dom4";
    ldir  = "info/types/dom4";
    inherit packument fetchInfo;
  } // latest';

}
