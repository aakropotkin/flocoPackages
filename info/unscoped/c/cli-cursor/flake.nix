{

  inputs.packument.url   = "https://registry.npmjs.org/cli-cursor?rev=16-facdfb40a88986ed9f79b22c920972f5";
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
    ident = "cli-cursor";
    ldir  = "info/unscoped/c/cli-cursor";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
