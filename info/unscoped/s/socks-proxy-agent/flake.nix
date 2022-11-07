{

  inputs.packument.url   = "https://registry.npmjs.org/socks-proxy-agent?rev=43-b85d6a5a202dace7bb2c706235cd8511";
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
    ident = "socks-proxy-agent";
    ldir  = "info/unscoped/s/socks-proxy-agent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
