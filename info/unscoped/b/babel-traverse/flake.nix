{

  inputs.packument.url   = "https://registry.npmjs.org/babel-traverse?rev=216-ccf4a4460557a8e322c32c1b2e9839f2";
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
    ident = "babel-traverse";
    ldir  = "info/unscoped/b/babel-traverse";
    inherit packument fetchInfo;
  } // latest';

}
