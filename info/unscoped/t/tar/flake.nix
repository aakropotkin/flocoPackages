{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tar?_rev=285-9df6df4b9b99107b49e1f5b2f04719fe";
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
    ident = "tar";
    ldir  = "info/unscoped/t/tar";
    inherit packument fetchInfo;
  } // latest';

}
