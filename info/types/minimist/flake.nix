{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fminimist?_rev=553-8edd24056896462da0d113c2c55249f0";
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
    ident = "@types/minimist";
    ldir  = "info/types/minimist";
    inherit packument fetchInfo;
  } // latest';

}
