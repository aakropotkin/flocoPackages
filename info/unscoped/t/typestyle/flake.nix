{

  inputs.packument.url   = "https://registry.npmjs.org/typestyle?rev=142-9a30a2e1f048e8d30b9028d89508c0e7";
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
    ident = "typestyle";
    ldir  = "info/unscoped/t/typestyle";
    inherit packument fetchInfo;
  } // latest';

}
