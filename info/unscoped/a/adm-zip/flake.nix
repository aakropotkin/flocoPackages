{

  inputs.packument.url   = "https://registry.npmjs.org/adm-zip?rev=132-3845a6c393bce1b34b6ae3d4b6125afd";
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
    ident = "adm-zip";
    ldir  = "info/unscoped/a/adm-zip";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
