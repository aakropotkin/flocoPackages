{

  inputs.packument.url   = "https://registry.npmjs.org/through2-concurrent?rev=25-64c5fd7ea4f428ebd3cbcc655a2441f9";
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
    ident = "through2-concurrent";
    ldir  = "info/unscoped/t/through2-concurrent";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
