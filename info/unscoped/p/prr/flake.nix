{

  inputs.packument.url   = "https://registry.npmjs.org/prr?rev=10-f1f394b267df5582fc35680250876b92";
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
    ident = "prr";
    ldir  = "info/unscoped/p/prr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
