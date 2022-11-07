{

  inputs.packument.url   = "https://registry.npmjs.org/rimraf?rev=467-cb35991d2a852693b311e156888e5a90";
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
    ident = "rimraf";
    ldir  = "info/unscoped/r/rimraf";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
