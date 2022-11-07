{

  inputs.packument.url   = "https://registry.npmjs.org/randomfill?rev=6-21b13062a258c3abbf8b047aef69b7d0";
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
    ident = "randomfill";
    ldir  = "info/unscoped/r/randomfill";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
