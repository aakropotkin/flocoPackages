{

  inputs.packument.url   = "https://registry.npmjs.org/stack-trace?rev=51-e86003799187c330093bc94b9a15a358";
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
    ident = "stack-trace";
    ldir  = "info/unscoped/s/stack-trace";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
