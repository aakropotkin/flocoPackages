{

  inputs.packument.url   = "https://registry.npmjs.org/@phosphor/algorithm?rev=23-1d104591959d68a8156b7db3a1cb7c29";
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
    ident = "@phosphor/algorithm";
    ldir  = "info/phosphor/algorithm";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
