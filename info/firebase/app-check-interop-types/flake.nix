{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@firebase/app-check-interop-types?_rev=630-dea39844384ad8f469f84ca6f35527a6";
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
    ident = "@firebase/app-check-interop-types";
    ldir  = "info/firebase/app-check-interop-types";
    inherit packument fetchInfo;
  } // latest';

}
