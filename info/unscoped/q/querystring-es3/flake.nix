{

  inputs.packument.url   = "https://registry.npmjs.org/querystring-es3?rev=10-43f0d7fc8cf9243af8e8c0fc918a7d88";
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
    ident = "querystring-es3";
    ldir  = "info/unscoped/q/querystring-es3";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
