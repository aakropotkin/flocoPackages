{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-flow?rev=57-a55f6f3b061043e011cbec9706978e3a";
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
    ident = "babel-preset-flow";
    ldir  = "info/unscoped/b/babel-preset-flow";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
