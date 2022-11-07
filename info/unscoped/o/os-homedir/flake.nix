{

  inputs.packument.url   = "https://registry.npmjs.org/os-homedir?rev=18-c1fa0a9a00bf91c6e24ec56ce331ad30";
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
    ident = "os-homedir";
    ldir  = "info/unscoped/o/os-homedir";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
