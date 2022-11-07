{

  inputs.packument.url   = "https://registry.npmjs.org/json-stringify-safe?rev=76-e83ee78a5e7769c599025c291f4386d5";
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
    ident = "json-stringify-safe";
    ldir  = "info/unscoped/j/json-stringify-safe";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
