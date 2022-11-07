{

  inputs.packument.url   = "https://registry.npmjs.org/promise-retry?rev=58-3326a2535547066deeee7befe9759220";
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
    ident = "promise-retry";
    ldir  = "info/unscoped/p/promise-retry";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
