{

  inputs.packument.url   = "https://registry.npmjs.org/duplexer?rev=47-3b1775b9eca0ed0ff8ce4eb52bd1b2e4";
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
    ident = "duplexer";
    ldir  = "info/unscoped/d/duplexer";
    inherit packument fetchInfo;
  } // latest';

}
