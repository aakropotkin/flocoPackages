{

  inputs.packument.url   = "https://registry.npmjs.org/merge-descriptors?rev=74-7faa27d6a563a6d8f50392456eae966d";
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
    ident = "merge-descriptors";
    ldir  = "info/unscoped/m/merge-descriptors";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
