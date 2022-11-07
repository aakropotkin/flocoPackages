{

  inputs.packument.url   = "https://registry.npmjs.org/micromark-util-encode?rev=6-679a7d50c4e959595d851a470801f9ec";
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
    ident = "micromark-util-encode";
    ldir  = "info/unscoped/m/micromark-util-encode";
    inherit packument fetchInfo;
  } // latest';

}
