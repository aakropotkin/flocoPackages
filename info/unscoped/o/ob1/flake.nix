{

  inputs.packument.url   = "https://registry.npmjs.org/ob1?rev=43-ccb2e34f5cb362edeedaf884ce435614";
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
    ident = "ob1";
    ldir  = "info/unscoped/o/ob1";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
