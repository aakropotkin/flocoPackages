{

  inputs.packument.url   = "https://registry.npmjs.org/reduce-reducers?rev=22-109f712d85af88911257975d1acda467";
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
    ident = "reduce-reducers";
    ldir  = "info/unscoped/r/reduce-reducers";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
