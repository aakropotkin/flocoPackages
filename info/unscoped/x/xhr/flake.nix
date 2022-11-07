{

  inputs.packument.url   = "https://registry.npmjs.org/xhr?rev=151-e120e61a2e396477f1eee57aa6d6a3cb";
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
    ident = "xhr";
    ldir  = "info/unscoped/x/xhr";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
