{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fauth-types?_rev=2529-09109eca51e640914bbc86cdb38c7647";
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
    ident = "@firebase/auth-types";
    ldir  = "info/firebase/auth-types";
    inherit packument fetchInfo;
  } // latest';

}
