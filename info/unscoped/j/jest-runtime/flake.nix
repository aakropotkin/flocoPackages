{

  inputs.packument.url   = "https://registry.npmjs.org/jest-runtime?rev=423-a077ca539afb4691d1ffdb53643c86b7";
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
    ident = "jest-runtime";
    ldir  = "info/unscoped/j/jest-runtime";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
