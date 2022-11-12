{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@popperjs/core?_rev=78-af9c475def0b553730dd6bb839d8e00c";
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
    scope = "@popperjs";
    ident = "@popperjs/core";
    ldir  = "info/popperjs/core";
    inherit packument fetchInfo;
  } // latest';

}
