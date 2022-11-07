{

  inputs.packument.url   = "https://registry.npmjs.org/webpack-bundle-analyzer?rev=294-f05f78fa863de546702a946aac5f1a63";
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
    ident = "webpack-bundle-analyzer";
    ldir  = "info/unscoped/w/webpack-bundle-analyzer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
