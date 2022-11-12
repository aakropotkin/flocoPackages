{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/asn1.js-rfc2560?_rev=35-a8f0fa2d20b8208840eb0382e7375ce9";
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
    ident = "asn1.js-rfc2560";
    ldir  = "info/unscoped/a/asn1.js-rfc2560";
    inherit packument fetchInfo;
  } // latest';

}
