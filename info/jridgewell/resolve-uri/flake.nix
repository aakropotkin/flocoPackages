{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@jridgewell/resolve-uri?_rev=13-a464ef8e46baaab514005e4acf3ea04d";
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
    scope = "@jridgewell";
    ident = "@jridgewell/resolve-uri";
    ldir  = "info/jridgewell/resolve-uri";
    inherit packument fetchInfo;
  } // latest';

}
