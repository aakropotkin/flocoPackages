{

  inputs.packument.url   = "https://registry.npmjs.org/listr-verbose-renderer?rev=11-a81b43f75dfd72172fe4040986dc5669";
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
    ident = "listr-verbose-renderer";
    ldir  = "info/unscoped/l/listr-verbose-renderer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
