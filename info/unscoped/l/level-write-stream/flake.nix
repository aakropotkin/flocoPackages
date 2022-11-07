{

  inputs.packument.url   = "https://registry.npmjs.org/level-write-stream?rev=9-32135a847116905c30fb825d5aa8ec6b";
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
    ident = "level-write-stream";
    ldir  = "info/unscoped/l/level-write-stream";
    inherit packument fetchInfo;
  } // latest';

}
