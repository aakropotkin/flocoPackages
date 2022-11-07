{

  inputs.packument.url   = "https://registry.npmjs.org/symbol-tree?rev=25-f83854c0c607263f845ab5f8dba105e2";
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
    ident = "symbol-tree";
    ldir  = "info/unscoped/s/symbol-tree";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
