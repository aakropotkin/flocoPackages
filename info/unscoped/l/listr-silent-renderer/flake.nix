{

  inputs.packument.url   = "https://registry.npmjs.org/listr-silent-renderer?rev=5-5b1dc8c703de50647dcc4eaaf7e17e17";
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
    ident = "listr-silent-renderer";
    ldir  = "info/unscoped/l/listr-silent-renderer";
    inherit packument fetchInfo;
  } // latest';

}
