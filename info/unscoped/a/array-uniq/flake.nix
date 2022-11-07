{

  inputs.packument.url   = "https://registry.npmjs.org/array-uniq?rev=25-6c4b97667a71c33fe32d7291d069996e";
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
    ident = "array-uniq";
    ldir  = "info/unscoped/a/array-uniq";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
