{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/app-check-types?rev=650-d5ba63b542e8f41e6d7a29600d771d88";
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
    ident = "@firebase/app-check-types";
    ldir  = "info/firebase/app-check-types";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
