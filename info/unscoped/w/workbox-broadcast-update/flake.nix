{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-broadcast-update?rev=59-fb2d198e3da6d72a28bae0bcc582cb8b";
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
    ident = "workbox-broadcast-update";
    ldir  = "info/unscoped/w/workbox-broadcast-update";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
