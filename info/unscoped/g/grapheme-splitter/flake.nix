{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/grapheme-splitter?_rev=6-74b7f107a42ae9c331f6e185593883b5";
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
    ident = "grapheme-splitter";
    ldir  = "info/unscoped/g/grapheme-splitter";
    inherit packument fetchInfo;
  } // latest';

}
