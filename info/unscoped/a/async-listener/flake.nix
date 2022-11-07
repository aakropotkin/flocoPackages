{

  inputs.packument.url   = "https://registry.npmjs.org/async-listener?rev=70-3ab605957edfb752e22085a2d4a6b9d8";
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
    ident = "async-listener";
    ldir  = "info/unscoped/a/async-listener";
    inherit packument fetchInfo;
  } // latest';

}
