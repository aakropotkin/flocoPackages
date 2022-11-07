{

  inputs.packument.url   = "https://registry.npmjs.org/remove-bom-stream?rev=9-7e14c808a325b4890a041c0b2750b827";
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
    ident = "remove-bom-stream";
    ldir  = "info/unscoped/r/remove-bom-stream";
    inherit packument fetchInfo;
  } // latest';

}
