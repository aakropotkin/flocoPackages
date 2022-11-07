{

  inputs.packument.url   = "https://registry.npmjs.org/level-iterator-stream?rev=21-8b5ad6f4e62d435c8cb176034a628b44";
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
    ident = "level-iterator-stream";
    ldir  = "info/unscoped/l/level-iterator-stream";
    inherit packument fetchInfo;
  } // latest';

}
