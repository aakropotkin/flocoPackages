{

  inputs.packument.url   = "https://registry.npmjs.org/resolve-cwd?rev=6-26571afdc46c4a573063568a97ef5526";
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
    ident = "resolve-cwd";
    ldir  = "info/unscoped/r/resolve-cwd";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
