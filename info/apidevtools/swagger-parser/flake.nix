{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@apidevtools/swagger-parser?_rev=11-32fa919e9a44b5145cd3821d33d8ae5e";
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
    scope = "@apidevtools";
    ident = "@apidevtools/swagger-parser";
    ldir  = "info/apidevtools/swagger-parser";
    inherit packument fetchInfo;
  } // latest';

}
