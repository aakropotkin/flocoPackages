{

  inputs.packument.url   = "https://registry.npmjs.org/parse-asn1?rev=42-d45f6747bc14c3069061e56f8bedbe76";
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
    ident = "parse-asn1";
    ldir  = "info/unscoped/p/parse-asn1";
    inherit packument fetchInfo;
  } // latest';

}
