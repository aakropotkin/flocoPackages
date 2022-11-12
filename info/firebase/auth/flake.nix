{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fauth?_rev=2729-1b32c644c332f9f21c788092ff1dea50";
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
    ident = "@firebase/auth";
    ldir  = "info/firebase/auth";
    inherit packument fetchInfo;
  } // latest';

}
