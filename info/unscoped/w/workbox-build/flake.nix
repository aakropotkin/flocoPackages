{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-build?rev=111-f6f0850ce810973fb2c77511af73c793";
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
    ident = "workbox-build";
    ldir  = "info/unscoped/w/workbox-build";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
