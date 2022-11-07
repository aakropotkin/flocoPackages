{

  inputs.packument.url   = "https://registry.npmjs.org/tunnel?rev=30-651e38dd715208bf261c58f72084fdfc";
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
    ident = "tunnel";
    ldir  = "info/unscoped/t/tunnel";
    inherit packument fetchInfo;
  } // latest';

}
