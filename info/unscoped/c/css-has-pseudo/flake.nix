{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/css-has-pseudo?_rev=20-372ed59a701f83dc405afa2464bfbe56";
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
    ident = "css-has-pseudo";
    ldir  = "info/unscoped/c/css-has-pseudo";
    inherit packument fetchInfo;
  } // latest';

}
