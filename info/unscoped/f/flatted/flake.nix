{

  inputs.packument.url   = "https://registry.npmjs.org/flatted?rev=29-763e4eab88c93543e3ba57e126c956b5";
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
    ident = "flatted";
    ldir  = "info/unscoped/f/flatted";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
