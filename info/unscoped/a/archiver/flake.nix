{

  inputs.packument.url   = "https://registry.npmjs.org/archiver?rev=224-c858ab6ad29578cba8526cc111f76b0b";
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
    ident = "archiver";
    ldir  = "info/unscoped/a/archiver";
    inherit packument fetchInfo;
  } // latest';

}
