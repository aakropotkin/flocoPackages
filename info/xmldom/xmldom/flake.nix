{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@xmldom/xmldom?_rev=24-db018b65d94596c63683b8efd5af289c";
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
    scope = "@xmldom";
    ident = "@xmldom/xmldom";
    ldir  = "info/xmldom/xmldom";
    inherit packument fetchInfo;
  } // latest';

}
