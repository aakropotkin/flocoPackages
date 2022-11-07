{

  inputs.packument.url   = "https://registry.npmjs.org/exif-parser?rev=36-ed8ce1a0d1161afaf03007358c08d216";
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
    ident = "exif-parser";
    ldir  = "info/unscoped/e/exif-parser";
    inherit packument fetchInfo;
  } // latest';

}
