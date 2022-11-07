{

  inputs.packument.url   = "https://registry.npmjs.org/@azure/storage-blob?rev=245-b56d7c924d0532e94f436767a3104471";
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
    scope = "@azure";
    ident = "@azure/storage-blob";
    ldir  = "info/azure/storage-blob";
    inherit packument fetchInfo;
  } // latest';

}
