{

  inputs.packument.url   = "https://registry.npmjs.org/shimmer?rev=36-6cac041b7304a8b288ab501858f1892e";
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
    ident = "shimmer";
    ldir  = "info/unscoped/s/shimmer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
