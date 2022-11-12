{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fmkdirp?_rev=573-4e2857b25f7b96a19e20043d07c7daca";
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
    ident = "@types/mkdirp";
    ldir  = "info/types/mkdirp";
    inherit packument fetchInfo;
  } // latest';

}
