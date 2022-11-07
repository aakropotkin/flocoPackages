{

  inputs.packument.url   = "https://registry.npmjs.org/data-urls?rev=10-f40d825b498865d1e19527d1f164989e";
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
    ident = "data-urls";
    ldir  = "info/unscoped/d/data-urls";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
