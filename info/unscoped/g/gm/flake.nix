{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gm?_rev=404-640d7763d3787dbfcec2f9ae4d3317b9";
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
    ident = "gm";
    ldir  = "info/unscoped/g/gm";
    inherit packument fetchInfo;
  } // latest';

}
