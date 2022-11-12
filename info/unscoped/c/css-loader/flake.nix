{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css-loader?_rev=310-fa4424e2680640878fbcfdb91e27018f";
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
    ident = "css-loader";
    ldir  = "info/unscoped/c/css-loader";
    inherit packument fetchInfo;
  } // latest';

}
