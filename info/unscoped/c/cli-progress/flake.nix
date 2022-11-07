{

  inputs.packument.url   = "https://registry.npmjs.org/cli-progress?rev=48-9c525aa9cc493313f5b2dfbbd355e2d2";
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
    ident = "cli-progress";
    ldir  = "info/unscoped/c/cli-progress";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
