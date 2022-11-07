{

  inputs.packument.url   = "https://registry.npmjs.org/ftp?rev=115-8a0b4cca020acd28f07736b0e442d395";
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
    ident = "ftp";
    ldir  = "info/unscoped/f/ftp";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
