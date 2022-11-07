{

  inputs.packument.url   = "https://registry.npmjs.org/pgpass?rev=19-b15ebd215b8c97332711b3f5066413d7";
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
    ident = "pgpass";
    ldir  = "info/unscoped/p/pgpass";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
