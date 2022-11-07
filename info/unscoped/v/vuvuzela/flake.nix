{

  inputs.packument.url   = "https://registry.npmjs.org/vuvuzela?rev=8-d626847e6f0441570f34baa4a11c6586";
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
    ident = "vuvuzela";
    ldir  = "info/unscoped/v/vuvuzela";
    inherit packument fetchInfo;
  } // latest';

}
