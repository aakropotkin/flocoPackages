{

  inputs.packument.url   = "https://registry.npmjs.org/http-status-codes?rev=78-67cc06e8ad23ce23eba766bc57f6b009";
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
    ident = "http-status-codes";
    ldir  = "info/unscoped/h/http-status-codes";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
