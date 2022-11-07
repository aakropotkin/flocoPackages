{

  inputs.packument.url   = "https://registry.npmjs.org/infer-owner?rev=24-aa12fb9dc1b5f1d984e0ebf20a581e46";
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
    ident = "infer-owner";
    ldir  = "info/unscoped/i/infer-owner";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
