{

  inputs.packument.url   = "https://registry.npmjs.org/btoa?rev=24-482abfaa6ad6d08debe14238995b8e7c";
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
    ident = "btoa";
    ldir  = "info/unscoped/b/btoa";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
