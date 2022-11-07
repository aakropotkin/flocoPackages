{

  inputs.packument.url   = "https://registry.npmjs.org/detect-node?rev=19-e6701a01ecba84e9bb36b8df448ec1c3";
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
    ident = "detect-node";
    ldir  = "info/unscoped/d/detect-node";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
