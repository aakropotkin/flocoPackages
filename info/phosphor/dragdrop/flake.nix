{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@phosphor%2fdragdrop?_rev=40-049438c5707737b8a66fb0922b3463cc";
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
    ident = "@phosphor/dragdrop";
    ldir  = "info/phosphor/dragdrop";
    inherit packument fetchInfo;
  } // latest';

}
