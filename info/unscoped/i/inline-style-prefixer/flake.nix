{

  inputs.packument.url   = "https://registry.npmjs.org/inline-style-prefixer?rev=82-f102a4f482ba88cdfcdd51f77268ebb7";
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
    ident = "inline-style-prefixer";
    ldir  = "info/unscoped/i/inline-style-prefixer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
