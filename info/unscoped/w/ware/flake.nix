{

  inputs.packument.url   = "https://registry.npmjs.org/ware?rev=44-37d9afff97f994fc09df74748a080d41";
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
    ident = "ware";
    ldir  = "info/unscoped/w/ware";
    inherit packument fetchInfo;
  } // latest';

}
