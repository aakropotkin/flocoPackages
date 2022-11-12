{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@intlify/vue-devtools?_rev=70-1ef479d6cae04ddfeab30e385d624bef";
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
    scope = "@intlify";
    ident = "@intlify/vue-devtools";
    ldir  = "info/intlify/vue-devtools";
    inherit packument fetchInfo;
  } // latest';

}
