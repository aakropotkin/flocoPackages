{

  inputs.packument.url   = "https://registry.npmjs.org/rc-trigger?rev=164-b8dca0b8019dd7b09242580b9477cfc0";
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
    ident = "rc-trigger";
    ldir  = "info/unscoped/r/rc-trigger";
    inherit packument fetchInfo;
  } // latest';

}
