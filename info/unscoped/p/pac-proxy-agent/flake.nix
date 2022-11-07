{

  inputs.packument.url   = "https://registry.npmjs.org/pac-proxy-agent?rev=25-018227be1d9015195be74c7dca51f455";
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
    ident = "pac-proxy-agent";
    ldir  = "info/unscoped/p/pac-proxy-agent";
    inherit packument fetchInfo;
  } // latest';

}
