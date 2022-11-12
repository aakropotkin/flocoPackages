{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2finstallations-compat?_rev=509-2e39428ef679462c9e7f7efb62916e4d";
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
    ident = "@firebase/installations-compat";
    ldir  = "info/firebase/installations-compat";
    inherit packument fetchInfo;
  } // latest';

}
