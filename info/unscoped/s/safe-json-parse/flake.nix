{

  inputs.packument.url   = "https://registry.npmjs.org/safe-json-parse?rev=16-01359bb0d3988b53bc0f3e104e6d8304";
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
    ident = "safe-json-parse";
    ldir  = "info/unscoped/s/safe-json-parse";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
