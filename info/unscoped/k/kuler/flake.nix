{

  inputs.packument.url   = "https://registry.npmjs.org/kuler?rev=13-d06c79f6e9e37709e3ec1b3f5079b8db";
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
    ident = "kuler";
    ldir  = "info/unscoped/k/kuler";
    inherit packument fetchInfo;
  } // latest';

}
