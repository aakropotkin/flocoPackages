{

  inputs.packument.url   = "https://registry.npmjs.org/exec-sh?rev=28-52d246b8d0787f83ce8dc419b82dd2f2";
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
    ident = "exec-sh";
    ldir  = "info/unscoped/e/exec-sh";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
