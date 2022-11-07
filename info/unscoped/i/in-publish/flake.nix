{

  inputs.packument.url   = "https://registry.npmjs.org/in-publish?rev=24-76ae5681eccae98ffafd361d37891c1c";
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
    ident = "in-publish";
    ldir  = "info/unscoped/i/in-publish";
    inherit packument fetchInfo;
  } // latest';

}
