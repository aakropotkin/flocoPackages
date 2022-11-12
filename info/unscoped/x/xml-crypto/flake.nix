{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/xml-crypto?_rev=107-9480677aa67d45c877c3c247b011ad4e";
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
    ident = "xml-crypto";
    ldir  = "info/unscoped/x/xml-crypto";
    inherit packument fetchInfo;
  } // latest';

}
