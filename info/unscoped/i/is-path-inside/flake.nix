{

  inputs.packument.url   = "https://registry.npmjs.org/is-path-inside?rev=17-3e6d984d302ee0294a57e069b4d4a8e4";
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
    ident = "is-path-inside";
    ldir  = "info/unscoped/i/is-path-inside";
    inherit packument fetchInfo;
  } // latest';

}
