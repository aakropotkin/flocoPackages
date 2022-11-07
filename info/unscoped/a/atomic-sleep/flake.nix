{

  inputs.packument.url   = "https://registry.npmjs.org/atomic-sleep?rev=1-efc5f44cdb4125909bb27f1ddb4e0380";
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
    ident = "atomic-sleep";
    ldir  = "info/unscoped/a/atomic-sleep";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
