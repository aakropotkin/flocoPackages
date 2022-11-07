{

  inputs.packument.url   = "https://registry.npmjs.org/caseless?rev=34-1c3ddbf030919e64d6494614d70424a4";
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
    ident = "caseless";
    ldir  = "info/unscoped/c/caseless";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
