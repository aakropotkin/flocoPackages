{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/regexpu-core?_rev=51-65599308effdde8cb1dc3309194aa970";
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
    ident = "regexpu-core";
    ldir  = "info/unscoped/r/regexpu-core";
    inherit packument fetchInfo;
  } // latest';

}
