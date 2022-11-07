{

  inputs.packument.url   = "https://registry.npmjs.org/pg-int8?rev=2-f36a718b2d94526cee7ee0a230537717";
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
    ident = "pg-int8";
    ldir  = "info/unscoped/p/pg-int8";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
