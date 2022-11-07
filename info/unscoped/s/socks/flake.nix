{

  inputs.packument.url   = "https://registry.npmjs.org/socks?rev=63-0420349e266aa428d0c8afcf8b1069c7";
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
    ident = "socks";
    ldir  = "info/unscoped/s/socks";
    inherit packument fetchInfo;
  } // latest';

}
