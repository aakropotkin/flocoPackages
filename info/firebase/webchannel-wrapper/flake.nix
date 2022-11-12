{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/webchannel-wrapper?_rev=2532-86748f672b4643ad756511e8e90d4d0c";
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
    scope = "@firebase";
    ident = "@firebase/webchannel-wrapper";
    ldir  = "info/firebase/webchannel-wrapper";
    inherit packument fetchInfo;
  } // latest';

}
