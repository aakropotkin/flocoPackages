{

  inputs.packument.url   = "https://registry.npmjs.org/lodash?rev=2713-585a7f93d6bb424d299e64298f80567e";
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
    ident = "lodash";
    ldir  = "info/unscoped/l/lodash";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
