{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase%2fauth-interop-types?_rev=1628-671ce4696d28a9bca196220eb710a4d1";
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
    ident = "@firebase/auth-interop-types";
    ldir  = "info/firebase/auth-interop-types";
    inherit packument fetchInfo;
  } // latest';

}
