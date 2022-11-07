{

  inputs.packument.url   = "https://registry.npmjs.org/read-package-json?rev=197-a6e3b6a82135101964b1231a72490b38";
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
    ident = "read-package-json";
    ldir  = "info/unscoped/r/read-package-json";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
