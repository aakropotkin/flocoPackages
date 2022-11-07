{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/commands?rev=49-6bffb52835654dd751969d0c4743dff1";
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
    scope = "@phosphor";
    ident = "@phosphor/commands";
    ldir  = "info/phosphor/commands";
    inherit packument fetchInfo;
  } // latest';

}
