{

  inputs.packument.url   = "https://registry.npmjs.org/macos-release?rev=15-42ee75a993d06a9b7b1ddffe0deae56d";
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
    ident = "macos-release";
    ldir  = "info/unscoped/m/macos-release";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
