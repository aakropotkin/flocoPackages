{

  inputs.packument.url   = "https://registry.npmjs.org/real-require?rev=4-8d6451bdeb15a45703d39c249897b23b";
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
    ident = "real-require";
    ldir  = "info/unscoped/r/real-require";
    inherit packument fetchInfo;
  } // latest';

}
