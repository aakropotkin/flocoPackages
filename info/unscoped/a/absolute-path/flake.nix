{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/absolute-path?_rev=8-083178c4f6adc2364a42fef660bc69af";
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
    ident = "absolute-path";
    ldir  = "info/unscoped/a/absolute-path";
    inherit packument fetchInfo;
  } // latest';

}
