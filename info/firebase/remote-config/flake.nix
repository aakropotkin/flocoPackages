{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/remote-config?_rev=1868-3ec6a72106940b61d54a1383e4fcb9ed";
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
    ident = "@firebase/remote-config";
    ldir  = "info/firebase/remote-config";
    inherit packument fetchInfo;
  } // latest';

}
