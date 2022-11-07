{

  inputs.packument.url   = "https://registry.npmjs.org/proxy-addr?rev=72-ecd499b36df991b31b51068ea3a733d9";
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
    ident = "proxy-addr";
    ldir  = "info/unscoped/p/proxy-addr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
