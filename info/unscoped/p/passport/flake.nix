{

  inputs.packument.url   = "https://registry.npmjs.org/passport?rev=684-b329657215fb641a0558edc3f8d50f22";
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
    ident = "passport";
    ldir  = "info/unscoped/p/passport";
    inherit packument fetchInfo;
  } // latest';

}
