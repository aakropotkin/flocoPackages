{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/domutils?rev=24-c20e8e07a8ae93ee63b55c2c4e4aae7a";
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
    ident = "@phosphor/domutils";
    ldir  = "info/phosphor/domutils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
