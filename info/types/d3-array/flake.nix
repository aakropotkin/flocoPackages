{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-array?_rev=802-2c54de713d7d017cb69e4a2930734b1f";
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
    ident = "@types/d3-array";
    ldir  = "info/types/d3-array";
    inherit packument fetchInfo;
  } // latest';

}
