{

  inputs.packument.url   = "https://registry.npmjs.org/semver-regex?rev=26-75abae2a6ac2741f0bd4c452b82a11f8";
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
    ident = "semver-regex";
    ldir  = "info/unscoped/s/semver-regex";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
