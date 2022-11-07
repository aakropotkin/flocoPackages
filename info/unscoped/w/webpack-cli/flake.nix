{

  inputs.packument.url   = "https://registry.npmjs.org/webpack-cli?rev=144-b93a3b812809889395746ceb4bf3b70b";
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
    ident = "webpack-cli";
    ldir  = "info/unscoped/w/webpack-cli";
    inherit packument fetchInfo;
  } // latest';

}
