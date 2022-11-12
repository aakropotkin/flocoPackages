{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@react-dnd%2finvariant?_rev=8-9a2d2e55eab32750a666773f3a8eff2c";
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
    scope = "@react-dnd";
    ident = "@react-dnd/invariant";
    ldir  = "info/react-dnd/invariant";
    inherit packument fetchInfo;
  } // latest';

}
