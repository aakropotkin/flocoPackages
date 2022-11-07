{

  inputs.packument.url   = "https://registry.npmjs.org/harmony-reflect?rev=65-d5f20efac2cb305bda6c0d397a3b35ed";
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
    ident = "harmony-reflect";
    ldir  = "info/unscoped/h/harmony-reflect";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
