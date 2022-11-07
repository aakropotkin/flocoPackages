{

  inputs.packument.url   = "https://registry.npmjs.org/karma?rev=963-bcdcb30a5a47dff506946ec1f80a17ec";
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
    ident = "karma";
    ldir  = "info/unscoped/k/karma";
    inherit packument fetchInfo;
  } // latest';

}
