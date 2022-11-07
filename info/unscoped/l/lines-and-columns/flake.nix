{

  inputs.packument.url   = "https://registry.npmjs.org/lines-and-columns?rev=35-d663fd327b1962d223aba3473f1432f7";
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
    ident = "lines-and-columns";
    ldir  = "info/unscoped/l/lines-and-columns";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
