{

  inputs.packument.url   = "https://registry.npmjs.org/xmldom?rev=160-33749a24f9cf38e359c6ae423c1be8b3";
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
    ident = "xmldom";
    ldir  = "info/unscoped/x/xmldom";
    inherit packument fetchInfo;
  } // latest';

}
