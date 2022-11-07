{

  inputs.packument.url   = "https://registry.npmjs.org/subarg?rev=18-b7379b65da9c737506d460cb86db5b9b";
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
    ident = "subarg";
    ldir  = "info/unscoped/s/subarg";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
