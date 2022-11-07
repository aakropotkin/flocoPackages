{

  inputs.packument.url   = "https://registry.npmjs.org/phantomjs-prebuilt?rev=122-26e58d0b42cc3c42272cb477c435613b";
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
    ident = "phantomjs-prebuilt";
    ldir  = "info/unscoped/p/phantomjs-prebuilt";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
