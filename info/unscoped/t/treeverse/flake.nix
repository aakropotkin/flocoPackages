{

  inputs.packument.url   = "https://registry.npmjs.org/treeverse?rev=31-3c2f894a515dfbdbaa5c3e7538039fa5";
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
    ident = "treeverse";
    ldir  = "info/unscoped/t/treeverse";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
