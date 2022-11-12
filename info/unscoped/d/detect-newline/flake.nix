{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/detect-newline?_rev=22-e02dab09053c51e4ad7589e3cc371dcf";
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
    scope = null;
    ident = "detect-newline";
    ldir  = "info/unscoped/d/detect-newline";
    inherit packument fetchInfo;
  } // latest';

}
