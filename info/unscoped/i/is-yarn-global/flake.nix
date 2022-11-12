{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-yarn-global?_rev=5-ca9e8904f4c0782932422714ffd4ab56";
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
    ident = "is-yarn-global";
    ldir  = "info/unscoped/i/is-yarn-global";
    inherit packument fetchInfo;
  } // latest';

}
