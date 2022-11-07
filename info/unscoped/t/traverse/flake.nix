{

  inputs.packument.url   = "https://registry.npmjs.org/traverse?rev=137-c5d70e0326f5595042c42ad5fbb66fc2";
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
    ident = "traverse";
    ldir  = "info/unscoped/t/traverse";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
