{

  inputs.packument.url   = "https://registry.npmjs.org/babel-cli?rev=267-100a18ae25ee25e10c003df1e2cafd71";
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
    ident = "babel-cli";
    ldir  = "info/unscoped/b/babel-cli";
    inherit packument fetchInfo;
  } // latest';

}
