{

  inputs.packument.url   = "https://registry.npmjs.org/safer-buffer?rev=9-194c14f9664bd82349dfb53b880b0067";
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
    ident = "safer-buffer";
    ldir  = "info/unscoped/s/safer-buffer";
    inherit packument fetchInfo;
  } // latest';

}
