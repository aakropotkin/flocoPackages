{

  inputs.packument.url   = "https://registry.npmjs.org/arrify?rev=17-8838df65ffc09b990070e2907fd391bc";
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
    ident = "arrify";
    ldir  = "info/unscoped/a/arrify";
    inherit packument fetchInfo;
  } // latest';

}
