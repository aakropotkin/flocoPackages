{

  inputs.packument.url   = "https://registry.npmjs.org/clean-up-path?rev=4-6fbc09ebe3f9a8cb081f15914a09ac50";
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
    ident = "clean-up-path";
    ldir  = "info/unscoped/c/clean-up-path";
    inherit packument fetchInfo;
  } // latest';

}
