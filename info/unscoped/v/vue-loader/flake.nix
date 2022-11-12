{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/vue-loader?_rev=399-b27e650a40ce3401848efc664ab8db48";
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
    ident = "vue-loader";
    ldir  = "info/unscoped/v/vue-loader";
    inherit packument fetchInfo;
  } // latest';

}
