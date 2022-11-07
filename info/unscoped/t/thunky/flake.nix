{

  inputs.packument.url   = "https://registry.npmjs.org/thunky?rev=15-5c2df7153f564e4f1ad92cc044ded160";
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
    ident = "thunky";
    ldir  = "info/unscoped/t/thunky";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
