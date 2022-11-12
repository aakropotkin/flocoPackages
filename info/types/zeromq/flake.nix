{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fzeromq?_rev=533-aedba2704cefe4edf8b0bbe72b7ab582";
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
    ident = "@types/zeromq";
    ldir  = "info/types/zeromq";
    inherit packument fetchInfo;
  } // latest';

}
