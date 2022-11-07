{

  inputs.packument.url   = "https://registry.npmjs.org/stringify-object?rev=131-6f93380492a8109dc67053d22aba4b54";
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
    ident = "stringify-object";
    ldir  = "info/unscoped/s/stringify-object";
    inherit packument fetchInfo;
  } // latest';

}
