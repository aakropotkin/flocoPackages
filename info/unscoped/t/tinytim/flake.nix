{

  inputs.packument.url   = "https://registry.npmjs.org/tinytim?rev=23-508078195c3d360612d3f9ea7838d4ae";
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
    ident = "tinytim";
    ldir  = "info/unscoped/t/tinytim";
    inherit packument fetchInfo;
  } // latest';

}
