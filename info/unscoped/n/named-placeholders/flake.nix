{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/named-placeholders?_rev=17-e87680cff95fea7909f0c4e868751e10";
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
    ident = "named-placeholders";
    ldir  = "info/unscoped/n/named-placeholders";
    inherit packument fetchInfo;
  } // latest';

}
