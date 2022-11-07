{

  inputs.packument.url   = "https://registry.npmjs.org/yargs-unparser?rev=45-d7b6a5a02c1079cf8cdb0e37d76aa8c0";
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
    ident = "yargs-unparser";
    ldir  = "info/unscoped/y/yargs-unparser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
