{

  inputs.packument.url   = "https://registry.npmjs.org/stoppable?rev=16-477a8fece8a41ff89b1c82561ff38756";
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
    ident = "stoppable";
    ldir  = "info/unscoped/s/stoppable";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
