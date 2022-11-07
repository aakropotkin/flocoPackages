{

  inputs.packument.url   = "https://registry.npmjs.org/fs-write-stream-atomic?rev=52-bbf38a19c7bccd698a48be2b54475718";
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
    ident = "fs-write-stream-atomic";
    ldir  = "info/unscoped/f/fs-write-stream-atomic";
    inherit packument fetchInfo;
  } // latest';

}
