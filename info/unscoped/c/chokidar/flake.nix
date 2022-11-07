{

  inputs.packument.url   = "https://registry.npmjs.org/chokidar?rev=413-5dc5cb394088ccfc62aa8a75a150f56b";
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
    ident = "chokidar";
    ldir  = "info/unscoped/c/chokidar";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
