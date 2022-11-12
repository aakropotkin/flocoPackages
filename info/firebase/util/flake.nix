{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/util?_rev=2616-4ba738c7c3f9142eab71b32ce68967d2";
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
    ident = "@firebase/util";
    ldir  = "info/firebase/util";
    inherit packument fetchInfo;
  } // latest';

}
