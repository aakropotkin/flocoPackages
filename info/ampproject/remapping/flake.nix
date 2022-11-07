{

  inputs.packument.url   = "https://registry.npmjs.org/@ampproject/remapping?rev=35-f8de04ea8a56d3a25266da5002265ad2";
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
    scope = "@ampproject";
    ident = "@ampproject/remapping";
    ldir  = "info/ampproject/remapping";
    inherit packument fetchInfo;
  } // latest';

}
