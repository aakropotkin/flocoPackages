{

  inputs.packument.url   = "https://registry.npmjs.org/tiny-relative-date?rev=6-49ffb63bb7dd97e7fe1bde428dcb7539";
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
    ident = "tiny-relative-date";
    ldir  = "info/unscoped/t/tiny-relative-date";
    inherit packument fetchInfo;
  } // latest';

}
