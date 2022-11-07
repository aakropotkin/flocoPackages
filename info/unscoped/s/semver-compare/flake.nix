{

  inputs.packument.url   = "https://registry.npmjs.org/semver-compare?rev=10-2c30e04ea6fe1c087fba2a24fda054fc";
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
    ident = "semver-compare";
    ldir  = "info/unscoped/s/semver-compare";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
