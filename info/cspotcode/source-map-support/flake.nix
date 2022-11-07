{

  inputs.packument.url   = "https://registry.npmjs.org/@cspotcode/source-map-support?rev=8-8c4fe410329c52a80de21e15f8404742";
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
    scope = "@cspotcode";
    ident = "@cspotcode/source-map-support";
    ldir  = "info/cspotcode/source-map-support";
    inherit packument fetchInfo;
  } // latest';

}
