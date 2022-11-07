{

  inputs.packument.url   = "https://registry.npmjs.org/read-pkg-up?rev=27-c938022ab2324e575d4558b28882d5e7";
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
    ident = "read-pkg-up";
    ldir  = "info/unscoped/r/read-pkg-up";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
