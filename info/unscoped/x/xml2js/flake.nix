{

  inputs.packument.url   = "https://registry.npmjs.org/xml2js?rev=444-37a51d5afc2c2803bc87e7d1f2da416a";
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
    ident = "xml2js";
    ldir  = "info/unscoped/x/xml2js";
    inherit packument fetchInfo;
  } // latest';

}
