{

  inputs.packument.url   = "https://registry.npmjs.org/rxjs-compat?rev=41-18cecab299dfac45da070112496685a2";
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
    ident = "rxjs-compat";
    ldir  = "info/unscoped/r/rxjs-compat";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
