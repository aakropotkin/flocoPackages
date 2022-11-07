{

  inputs.packument.url   = "https://registry.npmjs.org/dns-equal?rev=3-43e72f91afd0dc5d88dd2ea1cf1b4291";
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
    ident = "dns-equal";
    ldir  = "info/unscoped/d/dns-equal";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
