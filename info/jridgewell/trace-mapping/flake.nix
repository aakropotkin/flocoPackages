{

  inputs.packument.url   = "https://registry.npmjs.org/@jridgewell/trace-mapping?rev=31-94aa0b3db61f0de5b99196ebc67c4099";
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
    scope = "@jridgewell";
    ident = "@jridgewell/trace-mapping";
    ldir  = "info/jridgewell/trace-mapping";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
