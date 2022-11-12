{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types/underscore?_rev=1130-6c02b078364e16ba94817a43869534f4";
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
    ident = "@types/underscore";
    ldir  = "info/types/underscore";
    inherit packument fetchInfo;
  } // latest';

}
