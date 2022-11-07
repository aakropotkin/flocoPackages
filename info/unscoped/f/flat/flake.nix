{

  inputs.packument.url   = "https://registry.npmjs.org/flat?rev=105-2f8041c4f8ab6bf5c165193385ca45f0";
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
    ident = "flat";
    ldir  = "info/unscoped/f/flat";
    inherit packument fetchInfo;
  } // latest';

}
