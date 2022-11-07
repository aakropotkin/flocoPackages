{

  inputs.packument.url   = "https://registry.npmjs.org/ini?rev=92-5c02a51832a663e90a31cd2075f56e4a";
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
    ident = "ini";
    ldir  = "info/unscoped/i/ini";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
