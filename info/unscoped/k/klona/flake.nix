{

  inputs.packument.url   = "https://registry.npmjs.org/klona?rev=12-a1a0b712ca75c0618ff5f666a5d62332";
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
    ident = "klona";
    ldir  = "info/unscoped/k/klona";
    inherit packument fetchInfo;
  } // latest';

}
