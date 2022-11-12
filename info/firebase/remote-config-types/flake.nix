{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fremote-config-types?_rev=1731-1e681ba131d2227e8f7be0add4376f97";
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
    ident = "@firebase/remote-config-types";
    ldir  = "info/firebase/remote-config-types";
    inherit packument fetchInfo;
  } // latest';

}
