{

  inputs.packument.url   = "https://registry.npmjs.org/del?rev=375-c3b63d7e92859c1285d763af97823cdc";
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
    ident = "del";
    ldir  = "info/unscoped/d/del";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
