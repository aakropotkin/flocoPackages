{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2ftrusted-types?_rev=442-2423500c6d8468691506f4b11c522a28";
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
    scope = "@types";
    ident = "@types/trusted-types";
    ldir  = "info/types/trusted-types";
    inherit packument fetchInfo;
  } // latest';

}
