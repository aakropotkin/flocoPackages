{

  inputs.packument.url   = "https://registry.npmjs.org/duplexer2?rev=30-04f4ddac3091a57fcd9073a4ef155408";
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
    ident = "duplexer2";
    ldir  = "info/unscoped/d/duplexer2";
    inherit packument fetchInfo;
  } // latest';

}
