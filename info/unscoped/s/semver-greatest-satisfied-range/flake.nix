{

  inputs.packument.url   = "https://registry.npmjs.org/semver-greatest-satisfied-range?rev=11-4bbd5f901c34edc0083a7be313339b99";
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
    ident = "semver-greatest-satisfied-range";
    ldir  = "info/unscoped/s/semver-greatest-satisfied-range";
    inherit packument fetchInfo;
  } // latest';

}
