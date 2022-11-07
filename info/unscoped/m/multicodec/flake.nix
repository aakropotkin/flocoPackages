{

  inputs.packument.url   = "https://registry.npmjs.org/multicodec?rev=61-ee5707633efd03ee77eff7cefc881722";
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
    ident = "multicodec";
    ldir  = "info/unscoped/m/multicodec";
    inherit packument fetchInfo;
  } // latest';

}
