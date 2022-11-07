{

  inputs.packument.url   = "https://registry.npmjs.org/array-flatten?rev=41-e9848fdcf319843e70e5d5717ac5a64c";
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
    ident = "array-flatten";
    ldir  = "info/unscoped/a/array-flatten";
    inherit packument fetchInfo;
  } // latest';

}
