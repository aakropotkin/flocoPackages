{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/async-each-series?_rev=10-2f3490ad958b10419c36cf3c3d77cfb3";
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
    ident = "async-each-series";
    ldir  = "info/unscoped/a/async-each-series";
    inherit packument fetchInfo;
  } // latest';

}
