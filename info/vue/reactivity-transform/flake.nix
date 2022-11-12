{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@vue%2freactivity-transform?_rev=27-d3c1248085d809ba89667ea3fc14fb92";
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
    scope = "@vue";
    ident = "@vue/reactivity-transform";
    ldir  = "info/vue/reactivity-transform";
    inherit packument fetchInfo;
  } // latest';

}
