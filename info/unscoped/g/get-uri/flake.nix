{

  inputs.packument.url   = "https://registry.npmjs.org/get-uri?rev=27-32f9485e9a799efb812029490ffd1d5d";
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
    ident = "get-uri";
    ldir  = "info/unscoped/g/get-uri";
    inherit packument fetchInfo;
  } // latest';

}
