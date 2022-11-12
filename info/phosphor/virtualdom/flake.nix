{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@phosphor%2fvirtualdom?_rev=23-5210466c4fb61c8255193094708ea21f";
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
    ident = "@phosphor/virtualdom";
    ldir  = "info/phosphor/virtualdom";
    inherit packument fetchInfo;
  } // latest';

}
