{

  inputs.packument.url   = "https://registry.npmjs.org/tdigest?rev=15-b4bd3bc33d6187509db5f518d443af04";
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
    ident = "tdigest";
    ldir  = "info/unscoped/t/tdigest";
    inherit packument fetchInfo;
  } // latest';

}
