{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fresize-observer-browser?_rev=340-040d3e699eb71421eb0e8d0bc4375ff5";
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
    ident = "@types/resize-observer-browser";
    ldir  = "info/types/resize-observer-browser";
    inherit packument fetchInfo;
  } // latest';

}
