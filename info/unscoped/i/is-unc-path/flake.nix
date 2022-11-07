{

  inputs.packument.url   = "https://registry.npmjs.org/is-unc-path?rev=6-3d8efb9757e4ebd45177c0fb37d601fc";
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
    ident = "is-unc-path";
    ldir  = "info/unscoped/i/is-unc-path";
    inherit packument fetchInfo;
  } // latest';

}
