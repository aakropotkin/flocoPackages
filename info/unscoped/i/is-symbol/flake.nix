{

  inputs.packument.url   = "https://registry.npmjs.org/is-symbol?rev=12-6d0ff28b44814aacc7cdee6bb7ad5b49";
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
    ident = "is-symbol";
    ldir  = "info/unscoped/i/is-symbol";
    inherit packument fetchInfo;
  } // latest';

}
