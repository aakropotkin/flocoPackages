{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@icons%2fmaterial?_rev=14-3f386ddc210c2a1ab25cc741a9653c17";
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
    scope = "@icons";
    ident = "@icons/material";
    ldir  = "info/icons/material";
    inherit packument fetchInfo;
  } // latest';

}
