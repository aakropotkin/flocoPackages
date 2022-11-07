{

  inputs.packument.url   = "https://registry.npmjs.org/async-retry?rev=351-e75355bcb065725ed5f8d01328845b5f";
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
    ident = "async-retry";
    ldir  = "info/unscoped/a/async-retry";
    inherit packument fetchInfo;
  } // latest';

}
