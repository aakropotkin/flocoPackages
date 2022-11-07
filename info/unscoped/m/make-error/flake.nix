{

  inputs.packument.url   = "https://registry.npmjs.org/make-error?rev=35-680342415111c895180bb09301d1d1a0";
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
    ident = "make-error";
    ldir  = "info/unscoped/m/make-error";
    inherit packument fetchInfo;
  } // latest';

}
