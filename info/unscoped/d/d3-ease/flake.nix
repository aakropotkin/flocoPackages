{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/d3-ease?_rev=43-eb9385b3a6e4efa95986cb65c9774475";
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
    ident = "d3-ease";
    ldir  = "info/unscoped/d/d3-ease";
    inherit packument fetchInfo;
  } // latest';

}
