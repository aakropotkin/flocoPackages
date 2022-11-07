{

  inputs.packument.url   = "https://registry.npmjs.org/lilconfig?rev=12-a03d772dacf025a9175ed07f401a5aba";
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
    ident = "lilconfig";
    ldir  = "info/unscoped/l/lilconfig";
    inherit packument fetchInfo;
  } // latest';

}
