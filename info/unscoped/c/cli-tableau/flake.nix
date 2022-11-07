{

  inputs.packument.url   = "https://registry.npmjs.org/cli-tableau?rev=2-99705a2c27986c9c6f0af6e7a5f033b9";
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
    ident = "cli-tableau";
    ldir  = "info/unscoped/c/cli-tableau";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
