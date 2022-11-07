{

  inputs.packument.url   = "https://registry.npmjs.org/string_decoder?rev=45-275f9682a3d90f97e41a00319c2ff068";
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
    ident = "string_decoder";
    ldir  = "info/unscoped/s/string_decoder";
    inherit packument fetchInfo;
  } // latest';

}
