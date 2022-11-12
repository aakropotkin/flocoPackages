{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/postcss-color-rebeccapurple?_rev=24-1b1995dc593538c5a110fcec8ebdc1fa";
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
    ident = "postcss-color-rebeccapurple";
    ldir  = "info/unscoped/p/postcss-color-rebeccapurple";
    inherit packument fetchInfo;
  } // latest';

}
