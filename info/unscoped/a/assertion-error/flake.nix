{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/assertion-error?_rev=17-95a34e275de6ed2a7809e331289d8a38";
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
    ident = "assertion-error";
    ldir  = "info/unscoped/a/assertion-error";
    inherit packument fetchInfo;
  } // latest';

}
