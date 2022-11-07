{

  inputs.packument.url   = "https://registry.npmjs.org/which-pm?rev=7-52b33a9da65cc3ff596f71bd0eed67ad";
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
    ident = "which-pm";
    ldir  = "info/unscoped/w/which-pm";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
