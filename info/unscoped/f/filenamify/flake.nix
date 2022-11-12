{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/filenamify?_rev=26-810837978405dab63b608a909bd419c2";
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
    ident = "filenamify";
    ldir  = "info/unscoped/f/filenamify";
    inherit packument fetchInfo;
  } // latest';

}
