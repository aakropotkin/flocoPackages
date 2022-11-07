{

  inputs.packument.url   = "https://registry.npmjs.org/passport-strategy?rev=13-89e626bed777fbef65be42575ede67bd";
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
    ident = "passport-strategy";
    ldir  = "info/unscoped/p/passport-strategy";
    inherit packument fetchInfo;
  } // latest';

}
