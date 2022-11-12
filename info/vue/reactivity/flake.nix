{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@vue/reactivity?_rev=136-4e66c572af2fed7e4e3783e55369629b";
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
    ident = "@vue/reactivity";
    ldir  = "info/vue/reactivity";
    inherit packument fetchInfo;
  } // latest';

}
