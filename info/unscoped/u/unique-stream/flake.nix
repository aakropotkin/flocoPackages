{

  inputs.packument.url   = "https://registry.npmjs.org/unique-stream?rev=34-6d0ef0337215ee5a66ead684c93f313b";
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
    ident = "unique-stream";
    ldir  = "info/unscoped/u/unique-stream";
    inherit packument fetchInfo;
  } // latest';

}
