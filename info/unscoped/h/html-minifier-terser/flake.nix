{

  inputs.packument.url   = "https://registry.npmjs.org/html-minifier-terser?rev=19-e134149335ac994e2eae745c327b39f1";
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
    ident = "html-minifier-terser";
    ldir  = "info/unscoped/h/html-minifier-terser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
