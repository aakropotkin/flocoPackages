{

  inputs.packument.url   = "https://registry.npmjs.org/q?rev=705-96b94a78443d3cc97bf24ee7eb400683";
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
    ident = "q";
    ldir  = "info/unscoped/q/q";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
