{

  inputs.packument.url   = "https://registry.npmjs.org/xtend?rev=91-24adb65fa3cf361b59d9de0277c35d0d";
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
    ident = "xtend";
    ldir  = "info/unscoped/x/xtend";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
