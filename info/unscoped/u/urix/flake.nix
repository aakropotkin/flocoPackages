{

  inputs.packument.url   = "https://registry.npmjs.org/urix?rev=5-10b8bedbabb6dba8bfab6f1488f8db27";
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
    ident = "urix";
    ldir  = "info/unscoped/u/urix";
    inherit packument fetchInfo;
  } // latest';

}
