{

  inputs.packument.url   = "https://registry.npmjs.org/watch?rev=170-114a293cf1e9b5126b068a08c5d1913f";
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
    ident = "watch";
    ldir  = "info/unscoped/w/watch";
    inherit packument fetchInfo;
  } // latest';

}
