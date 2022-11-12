{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fyargs-parser?_rev=453-156ab2dd1fe474fe2273675ac97e0a29";
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
    ident = "@types/yargs-parser";
    ldir  = "info/types/yargs-parser";
    inherit packument fetchInfo;
  } // latest';

}
