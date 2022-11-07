{

  inputs.packument.url   = "https://registry.npmjs.org/readline-sync?rev=153-207928074bc061174ef0741b27d1d5fc";
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
    ident = "readline-sync";
    ldir  = "info/unscoped/r/readline-sync";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
