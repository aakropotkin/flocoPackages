{

  inputs.packument.url   = "https://registry.npmjs.org/fancy-log?rev=28-48a33acbccb23e9a76b53ac4a55cedfe";
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
    ident = "fancy-log";
    ldir  = "info/unscoped/f/fancy-log";
    inherit packument fetchInfo;
  } // latest';

}
