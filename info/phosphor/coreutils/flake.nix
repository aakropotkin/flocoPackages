{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/coreutils?rev=39-af959f47b2b6b4d773e65a8ca751602a";
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
    ident = "@phosphor/coreutils";
    ldir  = "info/phosphor/coreutils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
