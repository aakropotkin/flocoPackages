{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/request-debug?_rev=19-24dc5ab8da28d17929b5d23d91758efa";
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
    ident = "request-debug";
    ldir  = "info/unscoped/r/request-debug";
    inherit packument fetchInfo;
  } // latest';

}
