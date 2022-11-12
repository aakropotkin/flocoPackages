{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@types%2fd3-scale-chromatic?_rev=615-73adca8247202d53c7276273c6a7a17a";
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
    ident = "@types/d3-scale-chromatic";
    ldir  = "info/types/d3-scale-chromatic";
    inherit packument fetchInfo;
  } // latest';

}
