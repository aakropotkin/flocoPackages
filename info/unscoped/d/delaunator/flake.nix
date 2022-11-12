{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/delaunator?_rev=231-49cfc0c10adc7904464e3c482105dcef";
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
    ident = "delaunator";
    ldir  = "info/unscoped/d/delaunator";
    inherit packument fetchInfo;
  } // latest';

}
