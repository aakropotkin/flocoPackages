{

  inputs.packument.url   = "https://registry.npmjs.org/pstree.remy?rev=9-6402ca83c692f8759d2570614e352fb5";
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
    ident = "pstree.remy";
    ldir  = "info/unscoped/p/pstree.remy";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
