{

  inputs.packument.url   = "https://registry.npmjs.org/style-loader?rev=232-5368fcfb741c5c753ef0a93346c30399";
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
    ident = "style-loader";
    ldir  = "info/unscoped/s/style-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
