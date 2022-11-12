{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tough-cookie?_rev=110-a36f572c355a2b670b5ae6181894f572";
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
    scope = null;
    ident = "tough-cookie";
    ldir  = "info/unscoped/t/tough-cookie";
    inherit packument fetchInfo;
  } // latest';

}
