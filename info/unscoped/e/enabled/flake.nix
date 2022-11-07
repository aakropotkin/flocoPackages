{

  inputs.packument.url   = "https://registry.npmjs.org/enabled?rev=6-18a8ff4c14caaf4a098a35cb134f67f6";
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
    ident = "enabled";
    ldir  = "info/unscoped/e/enabled";
    inherit packument fetchInfo;
  } // latest';

}
