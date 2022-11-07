{

  inputs.packument.url   = "https://registry.npmjs.org/babel-jest?rev=389-3ee93de7cb7ddab2900967d715481338";
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
    ident = "babel-jest";
    ldir  = "info/unscoped/b/babel-jest";
    inherit packument fetchInfo;
  } // latest';

}
