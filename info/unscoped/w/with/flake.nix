{

  inputs.packument.url   = "https://registry.npmjs.org/with?rev=44-77669b04d56f7b6c12afef87839fcd97";
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
    ident = "with";
    ldir  = "info/unscoped/w/with";
    inherit packument fetchInfo;
  } // latest';

}
