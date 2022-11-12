{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fapp?_rev=2740-b8abbda7fa2b255991ab52792116e3a7";
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
    ident = "@firebase/app";
    ldir  = "info/firebase/app";
    inherit packument fetchInfo;
  } // latest';

}
