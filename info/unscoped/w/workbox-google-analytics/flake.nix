{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-google-analytics?rev=103-ab8337d804efdb14724a0587108d2a33";
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
    ident = "workbox-google-analytics";
    ldir  = "info/unscoped/w/workbox-google-analytics";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
