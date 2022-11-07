{

  inputs.packument.url   = "https://registry.npmjs.org/js-md4?rev=7-cfc7e7c27548c3b8dc723d1f556508b1";
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
    ident = "js-md4";
    ldir  = "info/unscoped/j/js-md4";
    inherit packument fetchInfo;
  } // latest';

}
