{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/messaging?rev=27-484368f2a0a77f2ce8db6932977669f6";
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
    ident = "@phosphor/messaging";
    ldir  = "info/phosphor/messaging";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
