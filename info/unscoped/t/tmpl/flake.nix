{

  inputs.packument.url   = "https://registry.npmjs.org/tmpl?rev=14-1c4ff61963d1b318dca3c3708ec796cc";
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
    ident = "tmpl";
    ldir  = "info/unscoped/t/tmpl";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
