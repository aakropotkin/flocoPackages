{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@phosphor%2fcollections?_rev=23-ee4451178f1164f72c3f8ad0a30ed05c";
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
    scope = "@phosphor";
    ident = "@phosphor/collections";
    ldir  = "info/phosphor/collections";
    inherit packument fetchInfo;
  } // latest';

}
