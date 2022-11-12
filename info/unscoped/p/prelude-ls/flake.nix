{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/prelude-ls?_rev=34-ec576ea324dcbb80bc603847ccd91d28";
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
    ident = "prelude-ls";
    ldir  = "info/unscoped/p/prelude-ls";
    inherit packument fetchInfo;
  } // latest';

}
