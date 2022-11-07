{

  inputs.packument.url   = "https://registry.npmjs.org/can-symlink?rev=6-f9c93a1ab9d60d6d14f3752ba84782ce";
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
    ident = "can-symlink";
    ldir  = "info/unscoped/c/can-symlink";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
