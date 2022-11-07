{

  inputs.packument.url   = "https://registry.npmjs.org/is-promise?rev=24-018f76fced593af5370f6b00ad38b5c2";
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
    ident = "is-promise";
    ldir  = "info/unscoped/i/is-promise";
    inherit packument fetchInfo;
  } // latest';

}
