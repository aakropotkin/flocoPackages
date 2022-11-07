{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-cacheable-response?rev=102-000b20c32e2a0b348072e52218de2c8d";
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
    ident = "workbox-cacheable-response";
    ldir  = "info/unscoped/w/workbox-cacheable-response";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
