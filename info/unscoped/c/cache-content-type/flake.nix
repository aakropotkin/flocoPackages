{

  inputs.packument.url   = "https://registry.npmjs.org/cache-content-type?rev=2-168c85db8415a3ca52fb4c912ee548c1";
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
    ident = "cache-content-type";
    ldir  = "info/unscoped/c/cache-content-type";
    inherit packument fetchInfo;
  } // latest';

}
