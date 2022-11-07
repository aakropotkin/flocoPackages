{

  inputs.packument.url   = "https://registry.npmjs.org/jsc-android?rev=33-5cbaf419e5c4b93afb7c173a14c40543";
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
    ident = "jsc-android";
    ldir  = "info/unscoped/j/jsc-android";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
