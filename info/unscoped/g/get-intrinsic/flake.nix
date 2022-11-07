{

  inputs.packument.url   = "https://registry.npmjs.org/get-intrinsic?rev=7-6de4c8a958f2bf5779c1b08506ea1784";
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
    ident = "get-intrinsic";
    ldir  = "info/unscoped/g/get-intrinsic";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
