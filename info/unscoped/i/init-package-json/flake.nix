{

  inputs.packument.url   = "https://registry.npmjs.org/init-package-json?rev=122-e5a0a62a31f52f8823838329bac5630b";
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
    ident = "init-package-json";
    ldir  = "info/unscoped/i/init-package-json";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
