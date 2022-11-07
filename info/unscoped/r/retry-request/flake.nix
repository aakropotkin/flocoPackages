{

  inputs.packument.url   = "https://registry.npmjs.org/retry-request?rev=44-1a4b93b43ebce2371275a42b7585958a";
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
    ident = "retry-request";
    ldir  = "info/unscoped/r/retry-request";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
