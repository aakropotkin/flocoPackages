{

  inputs.packument.url   = "https://registry.npmjs.org/workbox-core?rev=89-45c2db2683aee2a902961ecba4f1ff41";
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
    ident = "workbox-core";
    ldir  = "info/unscoped/w/workbox-core";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
