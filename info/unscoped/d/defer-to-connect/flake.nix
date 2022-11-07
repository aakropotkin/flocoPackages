{

  inputs.packument.url   = "https://registry.npmjs.org/defer-to-connect?rev=9-e1f0d81b2aa30ac80ddcb4cd5947f421";
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
    ident = "defer-to-connect";
    ldir  = "info/unscoped/d/defer-to-connect";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
