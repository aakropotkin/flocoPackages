{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/database?rev=2761-0c9278cde42163074ef4a6ba473e9ce3";
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
    ident = "@firebase/database";
    ldir  = "info/firebase/database";
    inherit packument fetchInfo;
  } // latest';

}
