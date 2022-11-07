{

  inputs.packument.url   = "https://registry.npmjs.org/@istanbuljs/load-nyc-config?rev=6-149d0f8486389db4ce242ae751d5eebc";
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
    scope = "@istanbuljs";
    ident = "@istanbuljs/load-nyc-config";
    ldir  = "info/istanbuljs/load-nyc-config";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
