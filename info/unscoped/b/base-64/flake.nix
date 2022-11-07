{

  inputs.packument.url   = "https://registry.npmjs.org/base-64?rev=31-a1f3e6175b9cf35cfd6f5f0b09d06a9d";
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
    ident = "base-64";
    ldir  = "info/unscoped/b/base-64";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
