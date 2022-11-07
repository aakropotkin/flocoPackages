{

  inputs.packument.url   = "https://registry.npmjs.org/phantomjs?rev=400-2626d38be3b71e969b3647c46d43ed01";
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
    ident = "phantomjs";
    ldir  = "info/unscoped/p/phantomjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
