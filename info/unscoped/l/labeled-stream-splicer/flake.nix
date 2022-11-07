{

  inputs.packument.url   = "https://registry.npmjs.org/labeled-stream-splicer?rev=62-2f9f367e2b3d465e63672cc89b5edcea";
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
    ident = "labeled-stream-splicer";
    ldir  = "info/unscoped/l/labeled-stream-splicer";
    inherit packument fetchInfo;
  } // latest';

}
