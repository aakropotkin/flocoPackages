{

  inputs.packument.url   = "https://registry.npmjs.org/shallowequal?rev=18-5dcef91b16f0a38e02b2a49bfcacf076";
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
    ident = "shallowequal";
    ldir  = "info/unscoped/s/shallowequal";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
