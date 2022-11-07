{

  inputs.packument.url   = "https://registry.npmjs.org/individual?rev=14-1c8de68ed55ecdf346b5cda49f85bd29";
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
    ident = "individual";
    ldir  = "info/unscoped/i/individual";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
