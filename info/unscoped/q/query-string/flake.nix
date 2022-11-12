{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/query-string?_rev=190-a19ebbe68090fce5e4348bf6ddc9cc6f";
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
    ident = "query-string";
    ldir  = "info/unscoped/q/query-string";
    inherit packument fetchInfo;
  } // latest';

}
