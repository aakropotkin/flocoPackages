{

  inputs.packument.url   = "https://registry.npmjs.org/zrender?rev=90-8b24262866797121b421e4eb1aa2ed39";
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
    ident = "zrender";
    ldir  = "info/unscoped/z/zrender";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
