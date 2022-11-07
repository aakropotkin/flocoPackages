{

  inputs.packument.url   = "https://registry.npmjs.org/bytebuffer?rev=259-ba3e927684ece301d06330789620a985";
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
    ident = "bytebuffer";
    ldir  = "info/unscoped/b/bytebuffer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
