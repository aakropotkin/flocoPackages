{

  inputs.packument.url   = "https://registry.npmjs.org/cli?rev=193-4d229ff779ee502aaf0bddd40995667d";
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
    ident = "cli";
    ldir  = "info/unscoped/c/cli";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
