{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/database-types?rev=2566-6a5fb5c21a1ca6e20113ee08ec43d27b";
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
    ident = "@firebase/database-types";
    ldir  = "info/firebase/database-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
